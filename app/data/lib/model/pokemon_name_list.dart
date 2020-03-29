import 'package:data/model/pokemon_name_item.dart';
import 'package:domain/entities/pokemon_name_list/pokemon_name_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_name_list.g.dart';

@JsonSerializable()
class PokemonNamesList extends PokemonNameListEntity {
  final String next;
  final int count;
  final List<PokemonNamesItem> results;

  PokemonNamesList({this.next, this.count, this.results})
      : super(next, count, results);

  factory PokemonNamesList.fromJson(Map<String, dynamic> json) {
    return _$PokemonNamesListFromJson(json);
  }
  Map<String, dynamic> toJson(instance) => _$PokemonNamesListToJson(this);
}
