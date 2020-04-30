import 'package:domain/entities/pokemon_name_list/pokemon_name_list.dart';
import 'package:domain/repositories/pokemonrepository.dart';
import 'package:equatable/equatable.dart';
import 'package:core/domain.dart';
import 'package:meta/meta.dart';

class GetPokemonListUseCase implements UseCase<PokemonNameListEntity, Params> {
  final PokemonRepositoryContract repositoryContract;

  GetPokemonListUseCase({@required this.repositoryContract});

  @override
  Future<PokemonNameListEntity> call(Params params) async {
    return await repositoryContract.getPokemonList(params.url);
  }
}

class Params extends Equatable {
  final String url;

  Params({this.url});

  @override
  List<Object> get props => [url];
}
