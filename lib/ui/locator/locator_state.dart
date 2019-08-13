library locator_state;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:gps_logger/data/model/model.dart';

part 'locator_state.g.dart';

abstract class LocatorState implements Built<LocatorState, LocatorStateBuilder> {
  bool get isLoading;
  bool get isFailure;
  PositionLocation get position;

  bool get isInitial => !isLoading 
  && position.isInitial
  && !isFailure;
  bool get isSuccessful =>
      !isLoading && !position.isInitial && !isFailure;

  LocatorState._();

  factory LocatorState([updates(LocatorStateBuilder b)]) = _$LocatorState;

  factory LocatorState.initial() {
    return LocatorState((b) => b
      ..isLoading = false
      ..position.replace(ModelFunctions.initializePositionLocation())
      ..isFailure = false
      );
  }

  factory LocatorState.loading() {
    return LocatorState((b) => b
      ..isLoading = true
      ..position.replace(ModelFunctions.initializePositionLocation())
      ..isFailure = false
      );
  }

  factory LocatorState.failure(String error) {
    return LocatorState((b) => b
      ..isLoading = false
      ..position.replace(ModelFunctions.initializePositionLocation())
      ..isFailure = true
      );
  }

  factory LocatorState.success(PositionLocation p) {
    return LocatorState((b) => b
      ..isLoading = false
      ..position.replace(p)
      ..isFailure = false
      );
  }
}
