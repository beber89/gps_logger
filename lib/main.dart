// Recent TODO:
// locator_repository_test.dart

//TODO:
// [x] Create Model for Location
// [x] Create Wrapper for Geolocator
// [ ] Create LocatorRepositoryTest
// [ ] Create LocatorRepository
// [ ] Create LocatorStateTest
// [ ] Create Locator events and states
//  [ ] Put in mind that live updates are required
//FIXME: 

// NOTE:


import 'package:flutter/material.dart';
import 'package:gps_logger/ui/home/home_page.dart';
import 'package:gps_logger/ui/satellites_signal/satellite_signal_page.dart';

void main() { 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SatelliteSignalPage(),
    );
  }
}
