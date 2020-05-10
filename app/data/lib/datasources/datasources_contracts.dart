import 'package:data/model/pokemon.dart';
import 'package:data/model/pokemon_name_list.dart';
import 'package:meta/meta.dart';

abstract class PokemonsRemoteDataSourceContract {
  Future<PokemonNamesList> getPokemonList(String url);

  Future<PokemonModel> getPokemonById(int id);

  Future<PokemonModel> getPokemonByName(String name);
}

abstract class LocalDataSourceContract {
  insertPokemonList({@required PokemonNamesList list, @required String url});

  insertPokemonInfo({@required PokemonModel pokemon});
}
