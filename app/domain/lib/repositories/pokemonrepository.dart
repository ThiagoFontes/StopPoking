import 'package:domain/entities/pokemon.dart';
import 'package:domain/entities/pokemon_name_list/pokemon_name_list.dart';

abstract class PokemonRepositoryContract {
  Future<PokemonNameListEntity> getPokemonList(int offset);

  Future<PokemonEntity> getPokemonById(int id);

  Future<PokemonEntity> getPokemonByName(String name);
}
