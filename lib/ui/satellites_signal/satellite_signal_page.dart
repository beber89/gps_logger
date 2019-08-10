import 'package:flutter/material.dart';

class SatelliteSignalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SatelliteSignalPageState();
  }
}

class _SatelliteSignalPageState extends State<SatelliteSignalPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("GPSy"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[Text("Sat1")],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {})
    );
  }
}
