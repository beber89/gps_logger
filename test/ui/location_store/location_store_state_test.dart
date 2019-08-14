import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_logger/data/model/model.dart';
import "package:gps_logger/ui/location_store/location_store_state.dart";

void main() {
  group('LocationStoreState ', () {
    LocationStoreState initial;
    LocationStoreState loading;
    LocationStoreState success;
    LocationStoreState failure;

    setUp(() {

      PositionLocation pos = PositionLocation((b)=>b
     ..latitude=29.9
     ..longitude=30.1
     ..timestamp=DateTime.fromMillisecondsSinceEpoch(99999999)
     );
     BuiltList<PositionStore> pStore = BuiltList<PositionStore>([PositionStore((b) =>b
     ..position.replace(pos)
     ..name = "location1"
     )]);

      initial = LocationStoreState.initial();
      loading = LocationStoreState.loading(pStore);
      success = LocationStoreState.success(pStore);
      failure = LocationStoreState.failure(pStore, 'Test error');
    });

    test(
      'isInitial returns true only when instantiated with initial factory',
      () {
        expect(initial.isInitial, true);
        expect(loading.isInitial, false);
        expect(success.isInitial, false);
        expect(failure.isInitial, false);
      },
    );

    test(
      'isSuccessful returns true only when instantiated with success factory',
      () {
        expect(initial.isSuccessful, false);
        expect(loading.isSuccessful, false);
        expect(success.isSuccessful, true);
        expect(failure.isSuccessful, false);
      },
    );
  });
}
