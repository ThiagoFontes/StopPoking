import 'package:data/model/moveitem.dart';
import 'package:data/model/types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class PokemonModel {
  final int id;
  final String name;
  final int weight;
  final int height;
  final List<Types> types;
  final List<Moves> moves;

  PokemonModel(
      {this.id, this.name, this.weight, this.height, this.types, this.moves});

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson(instance) => _$PokemonModelToJson(this);
}
