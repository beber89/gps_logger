// GENERATED CODE - DO NOT MODIFY BY HAND

part of position_store;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PositionStore> _$positionStoreSerializer =
    new _$PositionStoreSerializer();

class _$PositionStoreSerializer implements StructuredSerializer<PositionStore> {
  @override
  final Iterable<Type> types = const [PositionStore, _$PositionStore];
  @override
  final String wireName = 'PositionStore';

  @override
  Iterable<Object> serialize(Serializers serializers, PositionStore object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'position',
      serializers.serialize(object.position,
          specifiedType: const FullType(PositionLocation)),
    ];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PositionStore deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PositionStoreBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'position':
          result.position.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PositionLocation))
              as PositionLocation);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PositionStore extends PositionStore {
  @override
  final PositionLocation position;
  @override
  final String name;

  factory _$PositionStore([void Function(PositionStoreBuilder) updates]) =>
      (new PositionStoreBuilder()..update(updates)).build();

  _$PositionStore._({this.position, this.name}) : super._() {
    if (position == null) {
      throw new BuiltValueNullFieldError('PositionStore', 'position');
    }
  }

  @override
  PositionStore rebuild(void Function(PositionStoreBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PositionStoreBuilder toBuilder() => new PositionStoreBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PositionStore &&
        position == other.position &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, position.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PositionStore')
          ..add('position', position)
          ..add('name', name))
        .toString();
  }
}

class PositionStoreBuilder
    implements Builder<PositionStore, PositionStoreBuilder> {
  _$PositionStore _$v;

  PositionLocationBuilder _position;
  PositionLocationBuilder get position =>
      _$this._position ??= new PositionLocationBuilder();
  set position(PositionLocationBuilder position) => _$this._position = position;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  PositionStoreBuilder();

  PositionStoreBuilder get _$this {
    if (_$v != null) {
      _position = _$v.position?.toBuilder();
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PositionStore other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PositionStore;
  }

  @override
  void update(void Function(PositionStoreBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PositionStore build() {
    _$PositionStore _$result;
    try {
      _$result =
          _$v ?? new _$PositionStore._(position: position.build(), name: name);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'position';
        position.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PositionStore', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
