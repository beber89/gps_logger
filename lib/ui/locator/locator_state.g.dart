// GENERATED CODE - DO NOT MODIFY BY HAND

part of locator_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LocatorState extends LocatorState {
  @override
  final bool isLoading;
  @override
  final bool isFailure;
  @override
  final PositionLocation position;

  factory _$LocatorState([void Function(LocatorStateBuilder) updates]) =>
      (new LocatorStateBuilder()..update(updates)).build();

  _$LocatorState._({this.isLoading, this.isFailure, this.position})
      : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('LocatorState', 'isLoading');
    }
    if (isFailure == null) {
      throw new BuiltValueNullFieldError('LocatorState', 'isFailure');
    }
    if (position == null) {
      throw new BuiltValueNullFieldError('LocatorState', 'position');
    }
  }

  @override
  LocatorState rebuild(void Function(LocatorStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocatorStateBuilder toBuilder() => new LocatorStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LocatorState &&
        isLoading == other.isLoading &&
        isFailure == other.isFailure &&
        position == other.position;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, isLoading.hashCode), isFailure.hashCode),
        position.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LocatorState')
          ..add('isLoading', isLoading)
          ..add('isFailure', isFailure)
          ..add('position', position))
        .toString();
  }
}

class LocatorStateBuilder
    implements Builder<LocatorState, LocatorStateBuilder> {
  _$LocatorState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  bool _isFailure;
  bool get isFailure => _$this._isFailure;
  set isFailure(bool isFailure) => _$this._isFailure = isFailure;

  PositionLocationBuilder _position;
  PositionLocationBuilder get position =>
      _$this._position ??= new PositionLocationBuilder();
  set position(PositionLocationBuilder position) => _$this._position = position;

  LocatorStateBuilder();

  LocatorStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _isFailure = _$v.isFailure;
      _position = _$v.position?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LocatorState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LocatorState;
  }

  @override
  void update(void Function(LocatorStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LocatorState build() {
    _$LocatorState _$result;
    try {
      _$result = _$v ??
          new _$LocatorState._(
              isLoading: isLoading,
              isFailure: isFailure,
              position: position.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'position';
        position.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LocatorState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
