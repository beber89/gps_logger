// GENERATED CODE - DO NOT MODIFY BY HAND

part of position_location;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PositionLocation> _$positionLocationSerializer =
    new _$PositionLocationSerializer();

class _$PositionLocationSerializer
    implements StructuredSerializer<PositionLocation> {
  @override
  final Iterable<Type> types = const [PositionLocation, _$PositionLocation];
  @override
  final String wireName = 'PositionLocation';

  @override
  Iterable<Object> serialize(Serializers serializers, PositionLocation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'longitude',
      serializers.serialize(object.longitude,
          specifiedType: const FullType(double)),
      'latitude',
      serializers.serialize(object.latitude,
          specifiedType: const FullType(double)),
      'timestamp',
      serializers.serialize(object.timestamp,
          specifiedType: const FullType(DateTime)),
    ];
    if (object.mocked != null) {
      result
        ..add('mocked')
        ..add(serializers.serialize(object.mocked,
            specifiedType: const FullType(bool)));
    }
    if (object.altitiude != null) {
      result
        ..add('altitiude')
        ..add(serializers.serialize(object.altitiude,
            specifiedType: const FullType(double)));
    }
    if (object.accuracy != null) {
      result
        ..add('accuracy')
        ..add(serializers.serialize(object.accuracy,
            specifiedType: const FullType(double)));
    }
    if (object.heading != null) {
      result
        ..add('heading')
        ..add(serializers.serialize(object.heading,
            specifiedType: const FullType(double)));
    }
    if (object.speed != null) {
      result
        ..add('speed')
        ..add(serializers.serialize(object.speed,
            specifiedType: const FullType(double)));
    }
    if (object.speedAccuracy != null) {
      result
        ..add('speedAccuracy')
        ..add(serializers.serialize(object.speedAccuracy,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  PositionLocation deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PositionLocationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'longitude':
          result.longitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'latitude':
          result.latitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'mocked':
          result.mocked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'altitiude':
          result.altitiude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'accuracy':
          result.accuracy = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'heading':
          result.heading = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'speed':
          result.speed = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'speedAccuracy':
          result.speedAccuracy = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$PositionLocation extends PositionLocation {
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final DateTime timestamp;
  @override
  final bool mocked;
  @override
  final double altitiude;
  @override
  final double accuracy;
  @override
  final double heading;
  @override
  final double speed;
  @override
  final double speedAccuracy;

  factory _$PositionLocation(
          [void Function(PositionLocationBuilder) updates]) =>
      (new PositionLocationBuilder()..update(updates)).build();

  _$PositionLocation._(
      {this.longitude,
      this.latitude,
      this.timestamp,
      this.mocked,
      this.altitiude,
      this.accuracy,
      this.heading,
      this.speed,
      this.speedAccuracy})
      : super._() {
    if (longitude == null) {
      throw new BuiltValueNullFieldError('PositionLocation', 'longitude');
    }
    if (latitude == null) {
      throw new BuiltValueNullFieldError('PositionLocation', 'latitude');
    }
    if (timestamp == null) {
      throw new BuiltValueNullFieldError('PositionLocation', 'timestamp');
    }
  }

  @override
  PositionLocation rebuild(void Function(PositionLocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PositionLocationBuilder toBuilder() =>
      new PositionLocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PositionLocation &&
        longitude == other.longitude &&
        latitude == other.latitude &&
        timestamp == other.timestamp &&
        mocked == other.mocked &&
        altitiude == other.altitiude &&
        accuracy == other.accuracy &&
        heading == other.heading &&
        speed == other.speed &&
        speedAccuracy == other.speedAccuracy;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, longitude.hashCode),
                                    latitude.hashCode),
                                timestamp.hashCode),
                            mocked.hashCode),
                        altitiude.hashCode),
                    accuracy.hashCode),
                heading.hashCode),
            speed.hashCode),
        speedAccuracy.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PositionLocation')
          ..add('longitude', longitude)
          ..add('latitude', latitude)
          ..add('timestamp', timestamp)
          ..add('mocked', mocked)
          ..add('altitiude', altitiude)
          ..add('accuracy', accuracy)
          ..add('heading', heading)
          ..add('speed', speed)
          ..add('speedAccuracy', speedAccuracy))
        .toString();
  }
}

class PositionLocationBuilder
    implements Builder<PositionLocation, PositionLocationBuilder> {
  _$PositionLocation _$v;

  double _longitude;
  double get longitude => _$this._longitude;
  set longitude(double longitude) => _$this._longitude = longitude;

  double _latitude;
  double get latitude => _$this._latitude;
  set latitude(double latitude) => _$this._latitude = latitude;

  DateTime _timestamp;
  DateTime get timestamp => _$this._timestamp;
  set timestamp(DateTime timestamp) => _$this._timestamp = timestamp;

  bool _mocked;
  bool get mocked => _$this._mocked;
  set mocked(bool mocked) => _$this._mocked = mocked;

  double _altitiude;
  double get altitiude => _$this._altitiude;
  set altitiude(double altitiude) => _$this._altitiude = altitiude;

  double _accuracy;
  double get accuracy => _$this._accuracy;
  set accuracy(double accuracy) => _$this._accuracy = accuracy;

  double _heading;
  double get heading => _$this._heading;
  set heading(double heading) => _$this._heading = heading;

  double _speed;
  double get speed => _$this._speed;
  set speed(double speed) => _$this._speed = speed;

  double _speedAccuracy;
  double get speedAccuracy => _$this._speedAccuracy;
  set speedAccuracy(double speedAccuracy) =>
      _$this._speedAccuracy = speedAccuracy;

  PositionLocationBuilder();

  PositionLocationBuilder get _$this {
    if (_$v != null) {
      _longitude = _$v.longitude;
      _latitude = _$v.latitude;
      _timestamp = _$v.timestamp;
      _mocked = _$v.mocked;
      _altitiude = _$v.altitiude;
      _accuracy = _$v.accuracy;
      _heading = _$v.heading;
      _speed = _$v.speed;
      _speedAccuracy = _$v.speedAccuracy;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PositionLocation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PositionLocation;
  }

  @override
  void update(void Function(PositionLocationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PositionLocation build() {
    final _$result = _$v ??
        new _$PositionLocation._(
            longitude: longitude,
            latitude: latitude,
            timestamp: timestamp,
            mocked: mocked,
            altitiude: altitiude,
            accuracy: accuracy,
            heading: heading,
            speed: speed,
            speedAccuracy: speedAccuracy);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
