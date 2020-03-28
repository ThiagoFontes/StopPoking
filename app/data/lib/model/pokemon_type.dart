import 'dart:convert' as json;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:data/core/serializers.dart';

part 'pokemon_type.g.dart';

abstract class TypeItem implements Built<TypeItem, TypeItemBuilder> {
  static Serializer<TypeItem> get serializer => _$typeItemSerializer;

  int get slot;

  TypeName get type;

  TypeItem._();

  factory TypeItem([void Function(TypeItemBuilder) updates]) = _$TypeItem;

  TypeItem parseType(String jsonStr) {
    final parsed = json.jsonDecode(jsonStr);
    TypeItem type = standardSerializers.deserializeWith(TypeItem.serializer, parsed);
    return type;
  }
}

abstract class TypeName implements Built<TypeName, TypeNameBuilder> {
  static Serializer<TypeName> get serializer => _$typeNameSerializer;

  String get name;

  String get url;

  TypeName._();

  factory TypeName(updates(TypeNameBuilder b)) = _$TypeName;

  
  TypeName parseType(String jsonStr) {
    final parsed = json.jsonDecode(jsonStr);
    TypeName type = standardSerializers.deserializeWith(TypeName.serializer, parsed);
    return type;
  }
}

