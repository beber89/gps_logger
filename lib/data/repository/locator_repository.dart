import 'package:flutter/services.dart';
import 'package:gps_logger/data/model/locator/position_location.dart';
import 'package:gps_logger/wrapper/geolocator_wrapper.dart';

class LocatorRepository {
  GeolocatorWrapper _geolocatorWrapper;
  LocatorRepository(this._geolocatorWrapper);
  Stream<PositionLocation> get positionStream => _geolocatorWrapper.positionStream;
}