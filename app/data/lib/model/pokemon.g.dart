// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Pokemon> _$pokemonSerializer = new _$PokemonSerializer();

class _$PokemonSerializer implements StructuredSerializer<Pokemon> {
  @override
  final Iterable<Type> types = const [Pokemon, _$Pokemon];
  @override
  final String wireName = 'Pokemon';

  @override
  Iterable<Object> serialize(Serializers serializers, Pokemon object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'types',
      serializers.serialize(object.types,
          specifiedType:
              const FullType(BuiltList, const [const FullType(TypeItem)])),
    ];
    if (object.height != null) {
      result
        ..add('height')
        ..add(serializers.serialize(object.height,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Pokemon deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'types':
          result.types.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TypeItem)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$Pokemon extends Pokemon {
  @override
  final int id;
  @override
  final String name;
  @override
  final int height;
  @override
  final BuiltList<TypeItem> types;

  factory _$Pokemon([void Function(PokemonBuilder) updates]) =>
      (new PokemonBuilder()..update(updates)).build();

  _$Pokemon._({this.id, this.name, this.height, this.types}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Pokemon', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Pokemon', 'name');
    }
    if (types == null) {
      throw new BuiltValueNullFieldError('Pokemon', 'types');
    }
  }

  @override
  Pokemon rebuild(void Function(PokemonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonBuilder toBuilder() => new PokemonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Pokemon &&
        id == other.id &&
        name == other.name &&
        height == other.height &&
        types == other.types;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), name.hashCode), height.hashCode),
        types.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Pokemon')
          ..add('id', id)
          ..add('name', name)
          ..add('height', height)
          ..add('types', types))
        .toString();
  }
}

class PokemonBuilder implements Builder<Pokemon, PokemonBuilder> {
  _$Pokemon _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _height;
  int get height => _$this._height;
  set height(int height) => _$this._height = height;

  ListBuilder<TypeItem> _types;
  ListBuilder<TypeItem> get types =>
      _$this._types ??= new ListBuilder<TypeItem>();
  set types(ListBuilder<TypeItem> types) => _$this._types = types;

  PokemonBuilder();

  PokemonBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _height = _$v.height;
      _types = _$v.types?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Pokemon other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Pokemon;
  }

  @override
  void update(void Function(PokemonBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Pokemon build() {
    _$Pokemon _$result;
    try {
      _$result = _$v ??
          new _$Pokemon._(
              id: id, name: name, height: height, types: types.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'types';
        types.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Pokemon', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
