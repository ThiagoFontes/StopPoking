import 'package:domain/entity/pokemon_name_item.dart';
import 'package:domain/repositories/pokemonrepository.dart';
import 'package:meta/meta.dart';

class GetPokemonList {
  final PokemonRepositoryContract repositoryContract;

  GetPokemonList(this.repositoryContract);

  Future<List<PokemonNameItem>> execute({@required int number}) async {
    return await repositoryContract.getPokemonList(number);
  }
}