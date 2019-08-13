import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:gps_logger/data/model/locator/position_location.dart';
import 'package:gps_logger/ui/locator/locator_state.dart';

void main() {
  group('LocatorState ', () {
    LocatorState initial;
    LocatorState loading;
    LocatorState success;
    LocatorState failure;

    setUp(() {

      PositionLocation pos = PositionLocation((b)=>b
     ..latitude=29.9
     ..longitude=30.1
     ..timestamp=DateTime.fromMillisecondsSinceEpoch(10000)
     );

      initial = LocatorState.initial();
      loading = LocatorState.loading();
      success = LocatorState.success(pos);
      failure = LocatorState.failure('Test error');
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
