import 'package:core/network/network_info.dart';
import 'package:data/datasources/pokeapi_pokemons.dart';
import 'package:domain/entities/pokemon.dart';
import 'package:domain/entities/pokemon_name_list/pokemon_name_list.dart';
import 'package:domain/repositories.dart';
import 'package:meta/meta.dart';

class PokemonRepository implements PokemonRepositoryContract {
  final PokemonsRemoteDataSourceContract pokemonsRemoteDataSource;
  final NetworkInfo networkInfo;

  PokemonRepository({
    @required this.pokemonsRemoteDataSource,
    @required this.networkInfo,
  });

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
  Future<PokemonNameListEntity> getPokemonList(int offset) async {
    if (await networkInfo.isConnected) {
      return pokemonsRemoteDataSource.getPokemonList(offset);
    } else {
      return null;
    }
  }
}
