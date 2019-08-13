library locator_state;

import 'package:built_value/built_value.dart';
import 'package:gps_logger/data/model/model.dart';

part 'locator_state.g.dart';

abstract class LocatorState implements Built<LocatorState, LocatorStateBuilder> {
  bool get isLoading;
  bool get isFailure;
  PositionLocation get position;
  @nullable double get direction;

  bool get isInitial => !isLoading 
  && position.isInitial
  && direction == null
  && !isFailure;
  bool get isSuccessfulPosition =>
      !isLoading && !position.isInitial && !isFailure && direction == null;
  bool get isSuccessfulDirection =>
    !isLoading && direction != null && !isFailure && position.isInitial;

  LocatorState._();

  factory LocatorState([updates(LocatorStateBuilder b)]) = _$LocatorState;

  factory LocatorState.initial() {
    return LocatorState((b) => b
      ..isLoading = false
      ..direction = null
      ..position.replace(ModelFunctions.initializePositionLocation())
      ..isFailure = false
      );
  }

  factory LocatorState.loading() {
    return LocatorState((b) => b
      ..isLoading = true
      ..direction=null
      ..position.replace(ModelFunctions.initializePositionLocation())
      ..isFailure = false
      );
  }

  factory LocatorState.failure(String error) {
    return LocatorState((b) => b
      ..isLoading = false
      ..direction = null
      ..position.replace(ModelFunctions.initializePositionLocation())
      ..isFailure = true
      );
  }

  factory LocatorState.positionSuccess(PositionLocation p) {
    return LocatorState((b) => b
      ..isLoading = false
      ..direction = null
      ..position.replace(p)
      ..isFailure = false
      );
  }
  factory LocatorState.directionSuccess(double d) {
    return LocatorState((b) => b
      ..isLoading = false
      ..direction = d
      ..position.replace(ModelFunctions.initializePositionLocation())
      ..isFailure = false
      );
  }
}
