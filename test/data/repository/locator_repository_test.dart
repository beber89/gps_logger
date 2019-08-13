import 'dart:async';
import 'dart:io';

 import 'package:built_collection/built_collection.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gps_logger/data/model/locator/position_location.dart';
import 'package:gps_logger/data/repository/locator_repository.dart';
import 'package:gps_logger/wrapper/geolocator_wrapper.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';

 class MockGeolocatorWrapper extends Mock implements GeolocatorWrapper {
 }

 void main() {
   StreamController<PositionLocation> positionSubject = StreamController<PositionLocation>();
   MockGeolocatorWrapper mockGeolocator;

   setUp(() {
    mockGeolocator = MockGeolocatorWrapper();
  });

   group('', () {
     PositionLocation pos = PositionLocation((b)=>b
     ..latitude=29.9
     ..longitude=30.1
     ..timestamp=DateTime.fromMillisecondsSinceEpoch(10000)
     );
     test('Testing positionStream ', () async {
       when(mockGeolocator.positionStream).thenAnswer(
         (_) => positionSubject.stream
        ) ;
      LocatorRepository geolocatorWrapper = LocatorRepository(mockGeolocator);
       final expectedResult = [
         pos,
      ];
       expectLater(
        geolocatorWrapper.positionStream,
        emitsInOrder(expectedResult),
      );
      
      positionSubject.sink.add(pos);
      positionSubject.close();
    });
   });
 }