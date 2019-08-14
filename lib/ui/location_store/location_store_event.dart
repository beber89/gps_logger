library location_store_event;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:gps_logger/data/model/model.dart';



part 'location_store_event.g.dart';

abstract class LocationStoreEvent {}

class InitStoreEvent extends LocationStoreEvent {}

abstract class AssignLocationStoreEvent extends LocationStoreEvent
    implements Built<AssignLocationStoreEvent, AssignLocationStoreEventBuilder> {
  BuiltList<PositionStore> get store;

  AssignLocationStoreEvent._();

  factory AssignLocationStoreEvent([updates(AssignLocationStoreEventBuilder b)]) =
      _$AssignLocationStoreEvent;
}
