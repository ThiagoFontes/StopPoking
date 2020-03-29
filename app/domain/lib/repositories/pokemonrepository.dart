import 'package:domain/entity/pokemon.dart';
import 'package:domain/entity/pokemon_name_item.dart';

abstract class PokemonRepositoryContract {
  Future<List<PokemonNameItem>> getPokemonList(int offset);

  Future<Pokemon> getPokemonById(int id);

  Future<Pokemon> getPokemonByName(String name);
}
