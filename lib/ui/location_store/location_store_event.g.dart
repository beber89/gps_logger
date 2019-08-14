// GENERATED CODE - DO NOT MODIFY BY HAND

part of location_store_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AssignLocationStoreEvent extends AssignLocationStoreEvent {
  @override
  final BuiltList<PositionStore> store;

  factory _$AssignLocationStoreEvent(
          [void Function(AssignLocationStoreEventBuilder) updates]) =>
      (new AssignLocationStoreEventBuilder()..update(updates)).build();

  _$AssignLocationStoreEvent._({this.store}) : super._() {
    if (store == null) {
      throw new BuiltValueNullFieldError('AssignLocationStoreEvent', 'store');
    }
  }

  @override
  AssignLocationStoreEvent rebuild(
          void Function(AssignLocationStoreEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssignLocationStoreEventBuilder toBuilder() =>
      new AssignLocationStoreEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssignLocationStoreEvent && store == other.store;
  }

  @override
  int get hashCode {
    return $jf($jc(0, store.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AssignLocationStoreEvent')
          ..add('store', store))
        .toString();
  }
}

class AssignLocationStoreEventBuilder
    implements
        Builder<AssignLocationStoreEvent, AssignLocationStoreEventBuilder> {
  _$AssignLocationStoreEvent _$v;

  ListBuilder<PositionStore> _store;
  ListBuilder<PositionStore> get store =>
      _$this._store ??= new ListBuilder<PositionStore>();
  set store(ListBuilder<PositionStore> store) => _$this._store = store;

  AssignLocationStoreEventBuilder();

  AssignLocationStoreEventBuilder get _$this {
    if (_$v != null) {
      _store = _$v.store?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssignLocationStoreEvent other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AssignLocationStoreEvent;
  }

  @override
  void update(void Function(AssignLocationStoreEventBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AssignLocationStoreEvent build() {
    _$AssignLocationStoreEvent _$result;
    try {
      _$result = _$v ?? new _$AssignLocationStoreEvent._(store: store.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'store';
        store.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AssignLocationStoreEvent', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
