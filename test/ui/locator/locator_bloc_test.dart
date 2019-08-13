import 'dart:io';

 import 'package:built_collection/built_collection.dart';
import 'package:gps_logger/data/model/model.dart';
import 'package:gps_logger/data/repository/locator_repository.dart';
import 'package:gps_logger/ui/locator/locator.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';

 class _MockRepository extends Mock implements LocatorRepository {
 }

 void main() {
   BehaviorSubject<PositionLocation> positionSubject;
      BehaviorSubject<double> directionSubject;
  LocatorBloc locatorBloc;
  _MockRepository _mockRepository;

   setUp(() {
    _mockRepository = _MockRepository();
    locatorBloc = LocatorBloc(_mockRepository);
    positionSubject = BehaviorSubject<PositionLocation>();
    directionSubject = BehaviorSubject<double>();
  });
  tearDown((){
    positionSubject.close();
    directionSubject.close();
  });

   test('initial state is correct', () {
    expect(locatorBloc.initialState, LocatorState.initial());
  });

   group('LocatorBloc test ', () {
     PositionLocation pos = PositionLocation((b)=>b
     ..latitude=29.9
     ..longitude=30.1
     ..timestamp=DateTime.fromMillisecondsSinceEpoch(10000)
     );
     test('emits [initial, loading, positionSuccess] ', () async {
       when(_mockRepository.positionStream).thenAnswer((_) => positionSubject.stream) ;
       when(_mockRepository.directionStream).thenAnswer((_) => directionSubject.stream) ;
      

       final expectedResult = [
        LocatorState.initial(),
        LocatorState.loading(),
        LocatorState.positionSuccess(pos) ,
      ];

       expectLater(
        locatorBloc.state,
        emitsInOrder(expectedResult),
      );
      locatorBloc.start();
      Future.delayed(Duration(milliseconds: 2000)).then((_) {
        positionSubject.sink.add(pos);
      });
      
    });


    test('emits [initial, loading, positionSuccess, initial] ', () async {
       when(_mockRepository.positionStream).thenAnswer((_) => positionSubject.stream) ;
       when(_mockRepository.directionStream).thenAnswer((_) => directionSubject.stream) ;
      

       final expectedResult = [
        LocatorState.initial(),
        LocatorState.loading(),
        LocatorState.positionSuccess(pos) ,
        LocatorState.initial(),
      ];

       expectLater(
        locatorBloc.state,
        emitsInOrder(expectedResult),
      );
      locatorBloc.start();
      Future.delayed(Duration(milliseconds: 2000)).then((_)=>
        positionSubject.sink.add(pos)
      );
      Future.delayed(Duration(milliseconds: 3000)).then((_){
        locatorBloc.end();
      });
      
    });

    test('emits [initial, loading, directionSuccess, initial] ', () async {
      when(_mockRepository.positionStream).thenAnswer((_) => positionSubject.stream) ;
       when(_mockRepository.directionStream).thenAnswer((_) => directionSubject.stream) ;
      

       final expectedResult = [
        LocatorState.initial(),
        LocatorState.loading(),
        LocatorState.directionSuccess(1.3) ,
        LocatorState.initial(),
      ];

       expectLater(
        locatorBloc.state,
        emitsInOrder(expectedResult),
      );
      locatorBloc.start();
      Future.delayed(Duration(milliseconds: 2000)).then((_)=>
        directionSubject.sink.add(1.3)
      );
      Future.delayed(Duration(milliseconds: 3000)).then((_){
        locatorBloc.end();
      });
      
    });

  });
}