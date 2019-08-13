import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:gps_logger/data/model/locator/position_location.dart';
import 'package:gps_logger/ui/locator/locator_state.dart';

void main() {
  group('LocatorState ', () {
    LocatorState initial;
    LocatorState loading;
    LocatorState positionSuccess;
    LocatorState directionSuccess;
    LocatorState failure;

    setUp(() {

      PositionLocation pos = PositionLocation((b)=>b
     ..latitude=29.9
     ..longitude=30.1
     ..timestamp=DateTime.fromMillisecondsSinceEpoch(10000)
     );

      initial = LocatorState.initial();
      loading = LocatorState.loading();
      positionSuccess = LocatorState.positionSuccess(pos);
      directionSuccess = LocatorState.directionSuccess(1.0);
      failure = LocatorState.failure('Test error');
    });

    test(
      'isInitial returns true only when instantiated with initial factory',
      () {
        expect(initial.isInitial, true);
        expect(loading.isInitial, false);
        expect(positionSuccess.isInitial, false);
        expect(directionSuccess.isInitial, false);
        expect(failure.isInitial, false);
      },
    );

    test(
      'isSuccessfulPosition returns true only when instantiated with success factory',
      () {
        expect(initial.isSuccessfulPosition, false);
        expect(loading.isSuccessfulPosition, false);
        expect(positionSuccess.isSuccessfulPosition, true);
        expect(directionSuccess.isSuccessfulPosition, false);
        expect(failure.isSuccessfulPosition, false);
      },
    );

    test(
      'isSuccessfulDirection returns true only when instantiated with success factory',
      () {
        expect(initial.isSuccessfulDirection, false);
        expect(loading.isSuccessfulDirection, false);
        expect(positionSuccess.isSuccessfulDirection, false);
        expect(directionSuccess.isSuccessfulDirection, true);
        expect(failure.isSuccessfulDirection, false);
      },
    );
  });
}
