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
      BehaviorSubject<PositionLocation> positionSubject = BehaviorSubject<PositionLocation>();
  LocatorBloc locatorBloc;
  _MockRepository _mockRepository;

   setUp(() {
    _mockRepository = _MockRepository();
    locatorBloc = LocatorBloc(_mockRepository);
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
     test('emits [initial, loading, successful] ', () async {
       when(_mockRepository.positionStream).thenAnswer((_) => positionSubject.stream) ;
      

       final expectedResult = [
        LocatorState.initial(),
        LocatorState.loading(),
        LocatorState.success(pos) ,
      ];

       expectLater(
        locatorBloc.state,
        emitsInOrder(expectedResult),
      );
      locatorBloc.start();
      Future.delayed(Duration(milliseconds: 3000)).then((_) {
        positionSubject.sink.add(pos);
      });
      
    });


    test('emits [initial, loading, successful, initial] ', () async {
       when(_mockRepository.positionStream).thenAnswer((_) => positionSubject.stream) ;
      

       final expectedResult = [
        LocatorState.initial(),
        LocatorState.loading(),
        LocatorState.success(pos) ,
        LocatorState.initial(),
      ];

       expectLater(
        locatorBloc.state,
        emitsInOrder(expectedResult),
      );
      locatorBloc.start();
      Future.delayed(Duration(milliseconds: 3000)).then((_)=>
        positionSubject.sink.add(pos)
      );
      Future.delayed(Duration(milliseconds: 6000)).then((_){
        locatorBloc.end();
        positionSubject.close();
      });
      
    });

  });
}