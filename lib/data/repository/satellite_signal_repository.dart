import 'package:flutter/services.dart';

class SatelliteSignalRepository {
  static const MethodChannel _channel = const MethodChannel("dom.com/gpsy");

  Future<double> getSatellites() async {
    return await _channel.invokeMethod("getSatellites");
  }
  Future<bool> init() async {
    return await _channel.invokeMethod("init");
  }
}