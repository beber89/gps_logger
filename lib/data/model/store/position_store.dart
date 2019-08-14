library position_store;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gps_logger/data/model/model.dart';
import 'package:gps_logger/data/model/serializer/serializers.dart';


part 'position_store.g.dart';

abstract class PositionStore
    implements Built<PositionStore, PositionStoreBuilder> {
  PositionLocation get position;
  @nullable String get name;

  PositionStore._();


  factory PositionStore([updates(PositionStoreBuilder b)]) =
      _$PositionStore;

  String toJson() {
    return json
        .encode(serializers.serializeWith(PositionStore.serializer, this));
  }

  static PositionStore fromJson(String jsonString) {
    return serializers.deserializeWith(
        PositionStore.serializer, json.decode(jsonString));
  }

  static Serializer<PositionStore> get serializer =>
      _$positionStoreSerializer;
}
