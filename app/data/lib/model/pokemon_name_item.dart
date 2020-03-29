import 'package:domain/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_name_item.g.dart';

@JsonSerializable()
class PokemonNamesItem extends PokemonNameItemEntity {
  final String name;
  final String url;

  PokemonNamesItem(this.name, this.url);

  factory PokemonNamesItem.fromJson(Map<String, dynamic> json) =>
      _$PokemonNamesItemFromJson(json);

  Map<String, dynamic> toJson(instance) => _$PokemonNamesItemToJson(this);
}
