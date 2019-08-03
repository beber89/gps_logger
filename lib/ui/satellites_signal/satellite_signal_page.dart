import 'package:flutter/material.dart';
import 'package:gps_logger/data/repository/satellite_signal_repository.dart';

class SatelliteSignalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SatelliteSignalPageState();
  }
}

class _SatelliteSignalPageState extends State<SatelliteSignalPage> {
  double snr = -2;
  SatelliteSignalRepository repo = SatelliteSignalRepository();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repo.init();
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
            children: <Widget>[Text("Sat1"), Text(snr.toString())],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => repo.getSatellites().then((num) {
              setState(() {
                snr = num;
              });
            }),
      ),
    );
  }
}
