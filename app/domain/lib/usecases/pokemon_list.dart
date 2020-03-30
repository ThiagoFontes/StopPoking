import 'package:domain/entities/pokemon_name_list/pokemon_name_list.dart';
import 'package:domain/repositories/pokemonrepository.dart';
import 'package:equatable/equatable.dart';
import 'package:core/domain.dart';

class GetPokemonListUseCase implements UseCase<PokemonNameListEntity, Params> {
  final PokemonRepositoryContract repositoryContract;

  GetPokemonListUseCase(this.repositoryContract);

  @override
  Future<PokemonNameListEntity> call(Params params) async {
    return await repositoryContract.getPokemonList(params.offset);
  }
}

class Params extends Equatable {
  final int offset;

  Params({this.offset});

  @override
  List<Object> get props => [offset];

}