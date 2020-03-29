import 'package:domain/entities/pokemon_name_list/pokemon_name_list.dart';
import 'package:domain/repositories/pokemonrepository.dart';
import 'package:equatable/equatable.dart';
import 'package:core/domain.dart';

class GetPokemonList implements UseCase<PokemonNameListEntity, Params> {
  final PokemonRepositoryContract repositoryContract;

  GetPokemonList(this.repositoryContract);

  @override
  Future<PokemonNameListEntity> call(Params params) async {
    return await repositoryContract.getPokemonList(params.number);
  }
}

class Params extends Equatable {
  final int number;

  Params(this.number);

  @override
  List<Object> get props => [number];

}