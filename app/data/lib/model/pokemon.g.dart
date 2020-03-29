// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) {
  return PokemonModel(
    id: json['id'] as int,
    name: json['name'] as String,
    weight: json['weight'] as int,
    height: json['height'] as int,
    types: (json['types'] as List)
        ?.map(
            (e) => e == null ? null : Types.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    moves: (json['moves'] as List)
        ?.map((e) =>
            e == null ? null : MoveItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PokemonModelToJson(PokemonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'height': instance.height,
      'types': instance.types,
      'moves': instance.moves,
    };
