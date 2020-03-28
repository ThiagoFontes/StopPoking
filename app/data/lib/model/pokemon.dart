import 'package:data/model/moveitem.dart';
import 'package:data/model/types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  Pokemon(this.id, this.name);

  int id;
  String name;
  int weight;
  int height;
  List<Types> types;
  List<MoveItem> moves;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson(instance) => _$PokemonToJson(this);
}
