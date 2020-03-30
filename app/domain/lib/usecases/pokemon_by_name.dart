import 'package:core/domain.dart';
import 'package:domain/entities/pokemon.dart';
import 'package:domain/repositories/pokemonrepository.dart';
import 'package:equatable/equatable.dart';

class GetPokemonByName implements UseCase<PokemonEntity, String> {
  final PokemonRepositoryContract repositoryContract;

  GetPokemonByName(this.repositoryContract);

  @override
  Future<PokemonEntity> call(String name) async {
    return await repositoryContract.getPokemonByName(name);
  }
}