import 'package:domain/entities/pokemon.dart';
import 'package:domain/entities/pokemon_name_list/pokemon_name_item.dart';

abstract class PokemonRepositoryContract {
  Future<List<PokemonNameItemEntity>> getPokemonList(int offset);

  Future<PokemonEntity> getPokemonById(int id);

  Future<PokemonEntity> getPokemonByName(String name);
}
