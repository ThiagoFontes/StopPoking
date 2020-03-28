import 'dart:convert' as json;

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:data/core/serializers.dart';
import 'package:data/model/pokemon_type.dart';

part 'pokemon.g.dart';

abstract class Pokemon implements Built<Pokemon, PokemonBuilder> {
  static Serializer<Pokemon> get serializer => _$pokemonSerializer;

  int get id;

  String get name;

  @nullable
  int get height;

  @BuiltValueField(wireName: 'types')
  BuiltList<TypeItem> get types;

  Pokemon._();

  factory Pokemon(updates(PokemonBuilder b)) = _$Pokemon;
}

Pokemon parsePokemon(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  Pokemon pokemon =
      standardSerializers.deserializeWith(Pokemon.serializer, parsed);
  return pokemon;
}
