import 'package:data/datasources.dart';
import 'package:data/model/pokemon_name_list.dart';
import 'package:data/model/pokemon.dart';

class MoorDatasource
    implements PokemonsRemoteDataSourceContract, LocalDataSourceContract {
  @override
  Future<PokemonModel> getPokemonById(int id) {
    // TODO: implement getPokemonById
    throw UnimplementedError();
  }

  @override
  Future<PokemonModel> getPokemonByName(String name) {
    // TODO: implement getPokemonByName
    throw UnimplementedError();
  }

  @override
  Future<PokemonNamesList> getPokemonList(String url) {
    // TODO: implement getPokemonList
    throw UnimplementedError();
  }

  @override
  insertPokemonInfo({PokemonModel pokemon}) {
    // TODO: implement insertPokemonInfo
    throw UnimplementedError();
  }

  @override
  insertPokemonList({PokemonNamesList list, String url}) {
    // TODO: implement insertPokemonList
    throw UnimplementedError();
  }
}
