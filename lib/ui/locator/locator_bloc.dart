import 'package:bloc/bloc.dart';
import 'package:gps_logger/data/model/model.dart';
import 'dart:async';

import 'package:gps_logger/data/repository/locator_repository.dart';
import 'package:gps_logger/ui/locator/locator.dart';

class LocatorBloc extends Bloc<LocatorEvent, LocatorState> {
  LocatorRepository _locatorRepository;
  LocatorBloc(this._locatorRepository);
  StreamSubscription _subscription;

  void start() {
    dispatch(StartListeningEvent());
  }

  void newPositionLocation(PositionLocation p) {
    dispatch(NewLocatorValueEvent((b)=>b..position.replace(p)));
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
      _subscription = _locatorRepository.positionStream
      .listen((PositionLocation p){
        newPositionLocation(p);
      }) ;
    } else if (event is NewLocatorValueEvent) {
      PositionLocation position = event.position;
      yield LocatorState.success(position);
    } else if (event is EndListeningEvent) {
      await _subscription.cancel();
      yield LocatorState.initial();
    }
  }
}
