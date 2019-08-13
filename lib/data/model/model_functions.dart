import 'locator/position_location.dart';

class ModelFunctions {
  static initializePositionLocation() => 
  PositionLocation((b)=>b
  ..latitude = 0.0
  ..longitude = 0.0
  ..timestamp = DateTime.fromMillisecondsSinceEpoch(0)
  );
}