// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TypeItem> _$typeItemSerializer = new _$TypeItemSerializer();
Serializer<TypeName> _$typeNameSerializer = new _$TypeNameSerializer();

class _$TypeItemSerializer implements StructuredSerializer<TypeItem> {
  @override
  final Iterable<Type> types = const [TypeItem, _$TypeItem];
  @override
  final String wireName = 'TypeItem';

  @override
  Iterable<Object> serialize(Serializers serializers, TypeItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'slot',
      serializers.serialize(object.slot, specifiedType: const FullType(int)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(TypeName)),
    ];

    return result;
  }

  @override
  TypeItem deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TypeItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'slot':
          result.slot = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'type':
          result.type.replace(serializers.deserialize(value,
              specifiedType: const FullType(TypeName)) as TypeName);
          break;
      }
    }

    return result.build();
  }
}

class _$TypeNameSerializer implements StructuredSerializer<TypeName> {
  @override
  final Iterable<Type> types = const [TypeName, _$TypeName];
  @override
  final String wireName = 'TypeName';

  @override
  Iterable<Object> serialize(Serializers serializers, TypeName object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  TypeName deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TypeNameBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TypeItem extends TypeItem {
  @override
  final int slot;
  @override
  final TypeName type;

  factory _$TypeItem([void Function(TypeItemBuilder) updates]) =>
      (new TypeItemBuilder()..update(updates)).build();

  _$TypeItem._({this.slot, this.type}) : super._() {
    if (slot == null) {
      throw new BuiltValueNullFieldError('TypeItem', 'slot');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('TypeItem', 'type');
    }
  }

  @override
  TypeItem rebuild(void Function(TypeItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TypeItemBuilder toBuilder() => new TypeItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TypeItem && slot == other.slot && type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, slot.hashCode), type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TypeItem')
          ..add('slot', slot)
          ..add('type', type))
        .toString();
  }
}

class TypeItemBuilder implements Builder<TypeItem, TypeItemBuilder> {
  _$TypeItem _$v;

  int _slot;
  int get slot => _$this._slot;
  set slot(int slot) => _$this._slot = slot;

  TypeNameBuilder _type;
  TypeNameBuilder get type => _$this._type ??= new TypeNameBuilder();
  set type(TypeNameBuilder type) => _$this._type = type;

  TypeItemBuilder();

  TypeItemBuilder get _$this {
    if (_$v != null) {
      _slot = _$v.slot;
      _type = _$v.type?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TypeItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TypeItem;
  }

  @override
  void update(void Function(TypeItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TypeItem build() {
    _$TypeItem _$result;
    try {
      _$result = _$v ?? new _$TypeItem._(slot: slot, type: type.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'type';
        type.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TypeItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$TypeName extends TypeName {
  @override
  final String name;
  @override
  final String url;

  factory _$TypeName([void Function(TypeNameBuilder) updates]) =>
      (new TypeNameBuilder()..update(updates)).build();

  _$TypeName._({this.name, this.url}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('TypeName', 'name');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('TypeName', 'url');
    }
  }

  @override
  TypeName rebuild(void Function(TypeNameBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TypeNameBuilder toBuilder() => new TypeNameBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TypeName && name == other.name && url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TypeName')
          ..add('name', name)
          ..add('url', url))
        .toString();
  }
}

class TypeNameBuilder implements Builder<TypeName, TypeNameBuilder> {
  _$TypeName _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  TypeNameBuilder();

  TypeNameBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TypeName other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TypeName;
  }

  @override
  void update(void Function(TypeNameBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TypeName build() {
    final _$result = _$v ?? new _$TypeName._(name: name, url: url);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
