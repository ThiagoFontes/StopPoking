import 'package:domain/entity/pokemon_name_item.dart';
import 'package:domain/repositories/pokemonrepository.dart';
import 'package:equatable/equatable.dart';
import 'package:core/core.dart';

class GetPokemonList implements UseCase<List<PokemonNameItem>, Params> {
  final PokemonRepositoryContract repositoryContract;

  GetPokemonList(this.repositoryContract);

  @override
  Future<List<PokemonNameItem>> call(Params params) async {
    return await repositoryContract.getPokemonList(params.number);
  }
}

class Params extends Equatable {
  final int number;

  Params(this.number);

  @override
  List<Object> get props => [number];

}