import 'dart:io';

 import 'package:built_collection/built_collection.dart';
import 'package:gps_logger/data/model/model.dart';
import 'package:gps_logger/data/repository/repository.dart';
import 'package:gps_logger/ui/location_store/location_store.dart';
import 'package:gps_logger/ui/locator/locator.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

 class _MockRepository extends Mock implements LocationStoreRepository {
 }

 void main() {
  LocationStoreBloc bloc;
  LocationStoreRepository _mockRepository;

   setUp(() {
    _mockRepository = LocationStoreRepository();
    bloc = LocationStoreBloc(_mockRepository);
  });
  tearDown((){
  });

   test('initial state is correct', () {
    expect(bloc.initialState, LocationStoreState.initial());
  });

   group('LocatorBloc test ', () {
     PositionLocation pos = PositionLocation((b)=>b
     ..latitude=29.9
     ..longitude=30.1
     ..timestamp=DateTime.fromMillisecondsSinceEpoch(10000)
     );
     BuiltList<PositionStore> pStore = BuiltList<PositionStore>([PositionStore((b) =>b
     ..position.replace(pos)
     ..name = "location1"
     )]);
     BuiltList<PositionStore> emptyStore = BuiltList<PositionStore>([]);
     test('emits [initial, loading, success, loading, success] ', () async {
      
       final expectedResult = [
        LocationStoreState.initial(),
        LocationStoreState.loading(emptyStore),
        LocationStoreState.success(emptyStore),
        LocationStoreState.loading(emptyStore),
        LocationStoreState.success(pStore) ,
      ];

       expectLater(
        bloc.state,
        emitsInOrder(expectedResult),
      );
      bloc.start();
      bloc.addPositionStore(pStore[0]);
      
    });
  });
}