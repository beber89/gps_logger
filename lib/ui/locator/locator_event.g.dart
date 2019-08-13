// GENERATED CODE - DO NOT MODIFY BY HAND

part of locator_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NewLocatorValueEvent extends NewLocatorValueEvent {
  @override
  final PositionLocation position;

  factory _$NewLocatorValueEvent(
          [void Function(NewLocatorValueEventBuilder) updates]) =>
      (new NewLocatorValueEventBuilder()..update(updates)).build();

  _$NewLocatorValueEvent._({this.position}) : super._() {
    if (position == null) {
      throw new BuiltValueNullFieldError('NewLocatorValueEvent', 'position');
    }
  }

  @override
  NewLocatorValueEvent rebuild(
          void Function(NewLocatorValueEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewLocatorValueEventBuilder toBuilder() =>
      new NewLocatorValueEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewLocatorValueEvent && position == other.position;
  }

  @override
  int get hashCode {
    return $jf($jc(0, position.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NewLocatorValueEvent')
          ..add('position', position))
        .toString();
  }
}

class NewLocatorValueEventBuilder
    implements Builder<NewLocatorValueEvent, NewLocatorValueEventBuilder> {
  _$NewLocatorValueEvent _$v;

  PositionLocationBuilder _position;
  PositionLocationBuilder get position =>
      _$this._position ??= new PositionLocationBuilder();
  set position(PositionLocationBuilder position) => _$this._position = position;

  NewLocatorValueEventBuilder();

  NewLocatorValueEventBuilder get _$this {
    if (_$v != null) {
      _position = _$v.position?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewLocatorValueEvent other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NewLocatorValueEvent;
  }

  @override
  void update(void Function(NewLocatorValueEventBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NewLocatorValueEvent build() {
    _$NewLocatorValueEvent _$result;
    try {
      _$result =
          _$v ?? new _$NewLocatorValueEvent._(position: position.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'position';
        position.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NewLocatorValueEvent', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NewDirectionValueEvent extends NewDirectionValueEvent {
  @override
  final double direction;

  factory _$NewDirectionValueEvent(
          [void Function(NewDirectionValueEventBuilder) updates]) =>
      (new NewDirectionValueEventBuilder()..update(updates)).build();

  _$NewDirectionValueEvent._({this.direction}) : super._() {
    if (direction == null) {
      throw new BuiltValueNullFieldError('NewDirectionValueEvent', 'direction');
    }
  }

  @override
  NewDirectionValueEvent rebuild(
          void Function(NewDirectionValueEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewDirectionValueEventBuilder toBuilder() =>
      new NewDirectionValueEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewDirectionValueEvent && direction == other.direction;
  }

  @override
  int get hashCode {
    return $jf($jc(0, direction.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NewDirectionValueEvent')
          ..add('direction', direction))
        .toString();
  }
}

class NewDirectionValueEventBuilder
    implements Builder<NewDirectionValueEvent, NewDirectionValueEventBuilder> {
  _$NewDirectionValueEvent _$v;

  double _direction;
  double get direction => _$this._direction;
  set direction(double direction) => _$this._direction = direction;

  NewDirectionValueEventBuilder();

  NewDirectionValueEventBuilder get _$this {
    if (_$v != null) {
      _direction = _$v.direction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewDirectionValueEvent other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NewDirectionValueEvent;
  }

  @override
  void update(void Function(NewDirectionValueEventBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NewDirectionValueEvent build() {
    final _$result =
        _$v ?? new _$NewDirectionValueEvent._(direction: direction);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
