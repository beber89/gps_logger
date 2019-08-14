// GENERATED CODE - DO NOT MODIFY BY HAND

part of location_store_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LocationStoreState extends LocationStoreState {
  @override
  final bool isLoading;
  @override
  final bool isFailure;
  @override
  final BuiltList<PositionStore> store;

  factory _$LocationStoreState(
          [void Function(LocationStoreStateBuilder) updates]) =>
      (new LocationStoreStateBuilder()..update(updates)).build();

  _$LocationStoreState._({this.isLoading, this.isFailure, this.store})
      : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('LocationStoreState', 'isLoading');
    }
    if (isFailure == null) {
      throw new BuiltValueNullFieldError('LocationStoreState', 'isFailure');
    }
    if (store == null) {
      throw new BuiltValueNullFieldError('LocationStoreState', 'store');
    }
  }

  @override
  LocationStoreState rebuild(
          void Function(LocationStoreStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocationStoreStateBuilder toBuilder() =>
      new LocationStoreStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LocationStoreState &&
        isLoading == other.isLoading &&
        isFailure == other.isFailure &&
        store == other.store;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, isLoading.hashCode), isFailure.hashCode), store.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LocationStoreState')
          ..add('isLoading', isLoading)
          ..add('isFailure', isFailure)
          ..add('store', store))
        .toString();
  }
}

class LocationStoreStateBuilder
    implements Builder<LocationStoreState, LocationStoreStateBuilder> {
  _$LocationStoreState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  bool _isFailure;
  bool get isFailure => _$this._isFailure;
  set isFailure(bool isFailure) => _$this._isFailure = isFailure;

  ListBuilder<PositionStore> _store;
  ListBuilder<PositionStore> get store =>
      _$this._store ??= new ListBuilder<PositionStore>();
  set store(ListBuilder<PositionStore> store) => _$this._store = store;

  LocationStoreStateBuilder();

  LocationStoreStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _isFailure = _$v.isFailure;
      _store = _$v.store?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LocationStoreState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LocationStoreState;
  }

  @override
  void update(void Function(LocationStoreStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LocationStoreState build() {
    _$LocationStoreState _$result;
    try {
      _$result = _$v ??
          new _$LocationStoreState._(
              isLoading: isLoading, isFailure: isFailure, store: store.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'store';
        store.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LocationStoreState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
