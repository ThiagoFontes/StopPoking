import 'package:domain/entities/pokemon.dart';
import 'package:domain/entities/pokemon_name_list/pokemon_name_list.dart';
import 'package:domain/repositories/pokemonrepository.dart';

class PokemonsRemoteDataSource implements PokemonRepositoryContract{
  @override
  Future<PokemonEntity> getPokemonById(int id) {
    // TODO: implement getPokemonById
    return null;
  }

  @override
  Future<PokemonEntity> getPokemonByName(String name) {
    // TODO: implement getPokemonByName
    return null;
  }

  @override
  Future<PokemonNameListEntity> getPokemonList(int offset) {
    // TODO: implement getPokemonList
    return null;
  }
  
}