import 'package:bloc/bloc.dart';
import 'package:gps_logger/data/model/model.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:gps_logger/data/repository/locator_repository.dart';
import 'package:gps_logger/ui/locator/locator.dart';

class LocatorBloc extends Bloc<LocatorEvent, LocatorState> {
  LocatorRepository _locatorRepository;
  LocatorBloc(this._locatorRepository);
  StreamSubscription _positionSubscription, _directionSubscription;
  double _oldDirection;

  void start() {
    dispatch(StartListeningEvent());
  }

  void newPositionLocation(PositionLocation p) {
    dispatch(NewLocatorValueEvent((b)=>b..position.replace(p)));
  }

  void newDirectionCompass(double d) {
    dispatch(NewDirectionValueEvent((b)=>b..direction=d));
  }
  void end() {
    dispatch(EndListeningEvent());
  }
  @override
  LocatorState get initialState => LocatorState.initial();

  @override
  Stream<LocatorState> mapEventToState(
      LocatorState currentState, LocatorEvent event) async* {
    if (event is StartListeningEvent) {
      yield LocatorState.loading();
      _positionSubscription = _locatorRepository.positionStream
      .listen((PositionLocation p){
        newPositionLocation(p);
      }) ;
      _directionSubscription = _locatorRepository.directionStream
      .listen((double d){
        if(_oldDirection == null 
        || ((d-_oldDirection).abs() > 0.17*180/math.pi) 
        &&  (360-d+_oldDirection).abs() < 0.17*180/math.pi){
          _oldDirection = d;
          newDirectionCompass(d);
        }
      });
    } else if (event is NewLocatorValueEvent) {
      PositionLocation position = event.position;
      yield LocatorState.positionSuccess(position);
    } else if (event is NewDirectionValueEvent) {
      double direction = event.direction;
      yield LocatorState.directionSuccess(direction);
    } else if (event is EndListeningEvent) {
      try {
        await _positionSubscription.cancel().timeout(Duration(milliseconds: 1000));
        await _directionSubscription.cancel().timeout(Duration(milliseconds: 1000));
      } on TimeoutException catch(e) {
        print(e);
      } finally {
        yield LocatorState.initial();
      }
    }
  }
}
