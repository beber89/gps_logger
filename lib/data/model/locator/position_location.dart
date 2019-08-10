library position_location;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gps_logger/data/model/serializer/serializers.dart';


part 'position_location.g.dart';

abstract class PositionLocation
    implements Built<PositionLocation, PositionLocationBuilder> {
  double get longitude;
  double get latitude;
  DateTime get timestamp;
  @nullable bool get mocked;
  @nullable double get altitiude;
  @nullable double get accuracy;
  @nullable double get heading;
  @nullable double get speed;
  @nullable double get speedAccuracy;

  PositionLocation._();


  factory PositionLocation([updates(PositionLocationBuilder b)]) =
      _$PositionLocation;

  String toJson() {
    return json
        .encode(serializers.serializeWith(PositionLocation.serializer, this));
  }

  static PositionLocation fromJson(String jsonString) {
    return serializers.deserializeWith(
        PositionLocation.serializer, json.decode(jsonString));
  }

  static Serializer<PositionLocation> get serializer =>
      _$positionLocationSerializer;
}
