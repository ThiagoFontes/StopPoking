import 'package:core/domain/entities/response.dart';
import 'package:domain/entities/pokemon_name_list/pokemon_name_item.dart';

class PokemonNameListEntity extends Response {
  final String next;
  final int count;
  final List<PokemonNameItemEntity> results;

  PokemonNameListEntity(this.next, this.count, this.results) : super(results);

  @override
  List<Object> get props => [next, count, results];
}
