import 'package:domain/entities/pokemon.dart';
import 'package:domain/repositories/pokemonrepository.dart';
import 'package:domain/usecases.dart';
import 'package:test/test.dart';

import 'package:mockito/mockito.dart';

class MockPokemonRepository extends Mock implements PokemonRepositoryContract {}

void main() {
  GetPokemonByNameUseCase usecase;
  MockPokemonRepository mockPokemonRepository;
  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = GetPokemonByNameUseCase(mockPokemonRepository);
  });

  final String pokemonName = "charmander";
  final PokemonEntity item = PokemonEntity(
    id: 4,
    name: "charmander",
    height: 6,
    moves: <MovesEntity>[],
    weight: 85,
    types: <TypesEntity>[],
  );

  group("Get pokemons by name", () {
    test("Should get a single pokemon give the name", () async {
      // Arrange
      when(mockPokemonRepository.getPokemonByName(pokemonName))
          .thenAnswer((_) async => item);
      // Act
      final result = await usecase(pokemonName);
      // Assert
      expect(result, item);
      verify(mockPokemonRepository.getPokemonByName(pokemonName));
      verifyNoMoreInteractions(mockPokemonRepository);
    });
  });
}
