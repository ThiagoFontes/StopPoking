import 'dart:convert';

import 'package:data/model/pokemon.dart';
import 'package:data/model/pokemon_name_list.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:core/exception.dart';

abstract class PokemonsRemoteDataSourceContract {
  Future<PokemonNamesList> getPokemonList(String url);

  Future<PokemonModel> getPokemonById(int id);

  Future<PokemonModel> getPokemonByName(String name);
}

class PokemonsRemoteDataSource implements PokemonsRemoteDataSourceContract {
  final http.Client client;

  PokemonsRemoteDataSource({
    @required this.client,
  });

  @override
  Future<PokemonModel> getPokemonById(int id) {
    // TODO: implement getPokemonById
    return null;
  }

  @override
  Future<PokemonModel> getPokemonByName(String name) {
    // TODO: implement getPokemonByName
    return null;
  }

  @override
  Future<PokemonNamesList> getPokemonList(String url) async {
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return PokemonNamesList.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
