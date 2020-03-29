import 'package:core/core.dart';
import 'package:domain/entity/pokemon.dart';
import 'package:domain/repositories/pokemonrepository.dart';
import 'package:equatable/equatable.dart';

class GetPokemonByName implements UseCase<Pokemon, Params> {
  final PokemonRepositoryContract repositoryContract;

  GetPokemonByName(this.repositoryContract);

  @override
  Future<Pokemon> call(Params params) async {
    return await repositoryContract.getPokemonByName(params.name);
  }
}

class Params extends Equatable {
  final String name;

  Params(this.name);

  @override
  List<Object> get props => [name];
}
