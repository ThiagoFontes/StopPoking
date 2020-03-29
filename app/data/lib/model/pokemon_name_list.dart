import 'package:core/domain/entities/response.dart';
import 'package:data/model/pokemon_name_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_name_list.g.dart';

@JsonSerializable()
class PokemonNamesList extends Response {
  final String next;
  final int count;
  final List<PokemonNamesItem> results;

  PokemonNamesList({this.next, this.count, this.results}) : super(results);

  factory PokemonNamesList.fromJson(Map<String, dynamic> json) {
    return _$PokemonNamesListFromJson(json);
  }
	Map<String, dynamic> toJson( instance) => _$PokemonNamesListToJson(this);

}
