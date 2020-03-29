import 'package:data/model/pokemon.dart';
import 'package:data/model/pokemon_name_list.dart';
import 'package:domain/repositories/pokemonrepository.dart';

abstract class PokemonsRemoteDataSource implements PokemonRepositoryContract{
  Future<PokemonNamesList> getPokemonList(int offset);

  Future<PokemonModel> getPokemonById(int id);

  Future<PokemonModel> getPokemonByName(String name);
}