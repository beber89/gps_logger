library locator_event;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'dart:convert';

import 'package:gps_logger/data/model/model.dart';



part 'locator_event.g.dart';

abstract class LocatorEvent {}

class StartListeningEvent extends LocatorEvent {}

class EndListeningEvent extends LocatorEvent {}

abstract class NewLocatorValueEvent extends LocatorEvent
    implements Built<NewLocatorValueEvent, NewLocatorValueEventBuilder> {
  PositionLocation get position;

  NewLocatorValueEvent._();

  factory NewLocatorValueEvent([updates(NewLocatorValueEventBuilder b)]) =
      _$NewLocatorValueEvent;
}

