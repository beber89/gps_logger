import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:gps_logger/data/model/locator/position_location.dart';

class GeolocatorWrapper {
  Geolocator _geolocator;
  GeolocatorWrapper(this._geolocator);
  LocationOptions locationOptions =
      LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
  Stream<PositionLocation> get positionStream => _geolocator
      .getPositionStream(locationOptions)
      .transform<PositionLocation>(StreamTransformer.fromHandlers(
          handleData: (Position p, EventSink sink) =>
              sink.add(positionLocationFromPosition(p))));

  static positionLocationFromPosition(Position p) => PositionLocation((b) => b
    ..longitude = p.longitude
    ..latitude = p.latitude
    ..timestamp = p.timestamp
    ..mocked = p.mocked
    ..altitiude = p.altitude
    ..accuracy = p.accuracy
    ..heading = p.heading
    ..speed = p.speed
    ..speedAccuracy = p.speedAccuracy);
}
