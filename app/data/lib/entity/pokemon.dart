import 'package:data/entity/types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  Pokemon(this.id, this.name);

  int id;
  String name;
  int weight;
  List<Types> types;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson(instance) => _$PokemonToJson(this);
}
