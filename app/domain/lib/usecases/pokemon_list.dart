import 'package:domain/entities/pokemon_name_list/pokemon_name_list.dart';
import 'package:domain/repositories/pokemonrepository.dart';
import 'package:equatable/equatable.dart';
import 'package:core/domain.dart';
import 'package:meta/meta.dart';

class GetPokemonListUseCase implements UseCase<PokemonNameListEntity, Params> {
  final PokemonRepositoryContract _repositoryContract;

  GetPokemonListUseCase({@required repositoryContract})
      : _repositoryContract = repositoryContract;

  @override
  Future<PokemonNameListEntity> call(Params params) async {
    return await _repositoryContract.getPokemonList(params.url);
  }
}

class Params extends Equatable {
  final String url;

  Params({this.url});

  @override
  List<Object> get props => [url];
}
