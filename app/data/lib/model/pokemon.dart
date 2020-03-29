import 'package:data/model/moveitem.dart';
import 'package:data/model/types.dart';
import 'package:domain/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class PokemonModel extends Pokemon {
  final int id;
  final String name;
  final int weight;
  final int height;
  final List<Types> types;
  final List<MoveItem> moves;

  PokemonModel(
      {this.id, this.name, this.weight, this.height, this.types, this.moves});

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson(instance) => _$PokemonModelToJson(this);
}
