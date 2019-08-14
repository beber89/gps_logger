// Recent TODO:
// 

//TODO:
// [ ] Create locations list 
// [ ] Implement saving location functionality
// [ ] Add a setting view showing coords format
// [ ] Implement a DisplayPositionValue containing enum for chosen format
// [x] implement compass and view
// [x] Create Model for Location
// [x] Create Wrapper for Geolocator
// [x] Create LocatorRepositoryTest
// [x] Create LocatorRepository
// [x] Create LocatorStateTest
// [x] Create Locator events and states
//  [x] Put in mind that live updates are required
//FIXME: 
// [ ] Compass not rotating properly
//   [ ] Understand phone compass and angles

// NOTE:


import 'package:flutter/material.dart';
import 'package:gps_logger/injection_container.dart';
import 'package:gps_logger/ui/home/home_page.dart';
import 'package:gps_logger/ui/locator/locator_page.dart';

void main() { 
  initKiwi();
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
      routes: {
            '/': (BuildContext context) => LocatorPage(),
            '/locations': (BuildContext context) => Container(),
          },
    );
  }
}
