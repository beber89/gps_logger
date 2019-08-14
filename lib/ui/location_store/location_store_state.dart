library location_store_state;
import 'package:built_value/built_value.dart';

import 'package:built_collection/built_collection.dart';
import 'package:gps_logger/data/model/model.dart';

part 'location_store_state.g.dart';

abstract class LocationStoreState implements Built<LocationStoreState, LocationStoreStateBuilder> {
  bool get isLoading;
  bool get isFailure;
  BuiltList<PositionStore> get store;

  bool get isInitial => !isLoading && !isFailure && store.isEmpty;
  bool get isSuccessful =>
      !isLoading && !isFailure && store.isNotEmpty;

  LocationStoreState._();

  factory LocationStoreState([updates(LocationStoreStateBuilder b)]) = _$LocationStoreState;

  factory LocationStoreState.initial() {
    return LocationStoreState((b) => b
      ..isLoading = false
      ..store.replace(BuiltList<PositionStore>([]))
      ..isFailure = false
      );
  }

  factory LocationStoreState.loading(BuiltList<PositionStore> s) {
    return LocationStoreState((b) => b
      ..isLoading = true
      ..store.replace(s)
      ..isFailure = false
      );
  }

  factory LocationStoreState.failure(BuiltList<PositionStore> s, String error) {
    return LocationStoreState((b) => b
      ..isLoading = false
      ..store.replace(s)
      ..isFailure = true
      );
  }

  factory LocationStoreState.success(BuiltList<PositionStore> s) {
    return LocationStoreState((b) => b
      ..isLoading = false
      ..store.replace(s)
      ..isFailure = false
      );
  }
}
