import 'package:core/domain.dart';
import 'package:domain/entities/pokemon.dart';
import 'package:domain/repositories/pokemonrepository.dart';

class GetPokemonByNameUseCase implements UseCase<PokemonEntity, String> {
  final PokemonRepositoryContract repositoryContract;

  GetPokemonByNameUseCase(this.repositoryContract);

  @override
  Future<PokemonEntity> call(String name) async {
    return await repositoryContract.getPokemonByName(name);
  }
}
