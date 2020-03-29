import 'package:domain/entity/pokemon.dart';
import 'package:domain/entity/pokemon_name_item.dart';

abstract class PokemonRepositoryContract {
  Future<List<PokemonNameItem>> getPokemonList(int offset);

  Future<PokemonEntity> getPokemonById(int id);

  Future<PokemonEntity> getPokemonByName(String name);
}
