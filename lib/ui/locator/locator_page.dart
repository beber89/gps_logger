import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gps_logger/ui/locator/locator.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:flutter_bloc/flutter_bloc.dart';

class LocatorPage extends StatefulWidget {
  _LocatorPageState createState() => _LocatorPageState();
}

class _LocatorPageState extends State<LocatorPage> {
  final _locatorBloc = kiwi.Container().resolve<LocatorBloc>();
  double _direction;
  String _coords = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _locatorBloc.start();
  }

  @override
  Widget build(BuildContext context) {
    print("[McConnectedPage build]");
    return BlocProvider(
      bloc: _locatorBloc,
      child: _buildScaffold(),
    );
  }

  @override
  void dispose() {
    print("[McConnectedPage dispose]");
    super.dispose();
  }

  Widget _buildLiveCoordsPage(LocatorState state) {
    if (state.isSuccessfulDirection) {
      _direction = state.direction;
    } else {
      _coords = state.position.longitude.toString() +
          "E\n" +
          state.position.latitude.toString() +
          "N";
    }
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        CustomPaint(
            size: Size(300, 300),
            painter: _CompassPainter(_coords, _direction * -1 * math.pi / 180)),
        SizedBox(
          height: 40,
        ),
        Divider(
          color: Color.fromARGB(255, 0, 64, 255),
          height: 40,
        ),
      ],
    );
  }

  Scaffold _buildScaffold() {
    print("[LocatorPage _buildScaffold]");
    return Scaffold(
      appBar: AppBar(
        title: Text("LocatorPage"),
      ),
      body: BlocBuilder(
        bloc: _locatorBloc,
        builder: (BuildContext context, LocatorState state) {
          print(state);
          if (state.isSuccessfulPosition || state.isSuccessfulDirection) {
            return _buildLiveCoordsPage(state);
          } else if (state.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.isInitial) {
            return Container();
          }
        },
      ),
    );
  }
}

class GeometryHelper {
  static Offset fromDirection(Offset p, double direction, double distance) {
    return Offset(p.dx + distance * math.cos(direction),
        p.dx + distance * math.sin(direction));
  }
}

class _CompassPainter extends CustomPainter {
  String coords;
  double theta;
  _CompassPainter(this.coords, this.theta);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(theta);
    Paint line = Paint()
      ..color = Color.fromARGB(127, 255, 0, 0)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;
    // Offset center = Offset(size.width / 2, size.height / 2);
    Offset center = Offset(0, 0);
    double tickLength = 10;
    double radius = math.min(size.width / 2, size.height / 2);
    if (coords.isNotEmpty) {
      canvas.drawParagraph(writeLabel(coords, radius * 3 / 2, TextAlign.center),
          Offset(center.dx - radius * 3 / 4, center.dy - 20));
    }
    canvas.drawCircle(center, radius, line);
    List<List<dynamic>> ticksDirection = [
      ['E', 0.0],
      ['SE', math.pi / 4],
      ['S', math.pi / 2],
      ['SW', 3 * math.pi / 4],
      ['W', math.pi],
      ['NW', -3 * math.pi / 4],
      ['N', -math.pi / 2],
      ['NE', -math.pi / 4]
    ];
    for (List<dynamic> l in ticksDirection) {
      double d = l[1];
      var p1 = GeometryHelper.fromDirection(center, d, radius - tickLength);
      var p2 = GeometryHelper.fromDirection(center, d, radius);
      canvas.drawLine(p1, p2, line);

      double dpi = d / math.pi;
      double mult = dpi == -3 / 4
          ? 7 / 2
          : dpi == 3 / 4 || dpi == 1 || dpi == -1 / 2 ? 5 / 2 : 3 / 2;
      canvas.drawParagraph(writeLabel(l[0]),
          GeometryHelper.fromDirection(center, d, radius + mult * tickLength));
    }
  }

  @override
  bool shouldRepaint(_CompassPainter oldDelegate) =>
      // TODO: implement shouldRepaint
      oldDelegate.coords != coords || oldDelegate.theta != theta;

  ui.Paragraph writeLabel(String s,
      [double width = 30.0, TextAlign align = TextAlign.left]) {
    var paraBuild = ui.ParagraphBuilder(ui.ParagraphStyle(
      textAlign: align,
      textDirection: TextDirection.ltr,
      maxLines: 2,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ))
      ..pushStyle(ui.TextStyle(color: Color.fromARGB(128, 255, 0, 0)))
      ..addText(s);
    return paraBuild.build()..layout(ui.ParagraphConstraints(width: width));
  }
}
