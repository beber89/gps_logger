import 'dart:async';
import 'dart:io';

 import 'package:built_collection/built_collection.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gps_logger/data/model/locator/position_location.dart';
import 'package:gps_logger/wrapper/geolocator_wrapper.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';

 class MockGeolocator extends Mock implements Geolocator {
 }

 void main() {
   StreamController<Position> positionSubject = StreamController<Position>();
   MockGeolocator mockGeolocator;

   setUp(() {
    mockGeolocator = MockGeolocator();
  });

   group('', () {
     PositionLocation expectedPosition = PositionLocation((b)=>b
     ..latitude=29.9
     ..longitude=30.1
     ..timestamp=DateTime.fromMillisecondsSinceEpoch(10000)
     );
     test('Testing getPositionStream ', () async {
       when(mockGeolocator.getPositionStream(any)).thenAnswer(
         (_) => positionSubject.stream
        ) ;
      GeolocatorWrapper geolocatorWrapper = GeolocatorWrapper(mockGeolocator);
       final expectedResult = [
         expectedPosition,
      ];
       expectLater(
        geolocatorWrapper.positionStream,
        emitsInOrder(expectedResult),
      );
      
      positionSubject.sink.add(Position(
        latitude: 29.9, 
        longitude: 30.1,
        timestamp: DateTime.fromMillisecondsSinceEpoch(10000)));
      positionSubject.close();
    });
   });
 }