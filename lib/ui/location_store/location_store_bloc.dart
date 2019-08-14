import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:gps_logger/data/model/model.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:gps_logger/data/repository/repository.dart';
import 'package:gps_logger/ui/location_store/location_store.dart';

class LocationStoreBloc extends Bloc<LocationStoreEvent, LocationStoreState> {
  LocationStoreRepository _repo;
  LocationStoreBloc(this._repo);
  BuiltList<PositionStore> _store = BuiltList<PositionStore>([]);

  void start() {
    print("[LocationStoreBloc Start]");
    dispatch(InitStoreEvent());
  }

  void addPositionStore(PositionStore p) {
    print("[LocationStoreBloc addPositionStore]");
    dispatch(AssignLocationStoreEvent(
      (b)=>b..store.replace((_store.toBuilder()..add(p)).build())
    ));
  }
  @override
  LocationStoreState get initialState => LocationStoreState.initial();

  @override
  Stream<LocationStoreState> mapEventToState(
      LocationStoreState currentState, LocationStoreEvent event) async* {
    if (event is InitStoreEvent) {
      print("[LocationStoreBloc Stream InitStoreEvent]");
      yield LocationStoreState.loading(_store);
      // Load store from storage here
      _store = BuiltList<PositionStore>([]);
      yield LocationStoreState.success(_store);
    } else if (event is AssignLocationStoreEvent) {
      print("[LocationStoreBloc Stream AssignLocationStoreEvent]");
      yield LocationStoreState.loading(_store);
      _store = event.store;
      yield LocationStoreState.success(_store);
    }
  }
}
