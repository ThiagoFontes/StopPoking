// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_name_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonNamesList _$PokemonNamesListFromJson(Map<String, dynamic> json) {
  return PokemonNamesList(
    next: json['next'] as String,
    count: json['count'] as int,
    results: (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : PokemonNamesItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PokemonNamesListToJson(PokemonNamesList instance) =>
    <String, dynamic>{
      'next': instance.next,
      'count': instance.count,
      'results': instance.results,
    };
