import 'package:data/model/pokemon_name_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_name_list.g.dart';

@JsonSerializable()
class PokemonNamesList {
  String next;
  int count;
  List<PokemonNamesItem> results;

  PokemonNamesList({this.next, this.count, this.results});

  factory PokemonNamesList.fromJson(Map<String, dynamic> json) => _$PokemonNamesListFromJson(json);
	Map<String, dynamic> toJson( instance) => _$PokemonNamesListToJson(this);

}
