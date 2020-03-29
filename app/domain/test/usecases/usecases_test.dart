import 'package:domain/entities/pokemon_name_list/pokemon_name_item.dart';
import 'package:domain/entities/pokemon_name_list/pokemon_name_list.dart';
import 'package:domain/repositories/pokemonrepository.dart';
import 'package:domain/usecases/pokemon_list.dart';
import 'package:test/test.dart';

import 'package:mockito/mockito.dart';

class MockPokemonRepository extends Mock implements PokemonRepositoryContract {}

void main() {
  GetPokemonList usecase;
  MockPokemonRepository mockPokemonRepository;
  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = GetPokemonList(mockPokemonRepository);
  });

  final offsetNumber = 960;

  PokemonNameItemEntity item = PokemonNameItemEntity(
      name: "togedemaru-totem",
      url: "https://pokeapi.co/api/v2/pokemon/10154/");
  final PokemonNameListEntity pokemonNameList =
      PokemonNameListEntity(null, 964, [item]);

  group("Pokemons List tests with mocks", () {
    test("Get final list of pokemons (offset 960)", () async {
      // Arrange
      when(mockPokemonRepository.getPokemonList(offsetNumber))
          .thenAnswer((_) async => pokemonNameList);
      // Act
      final result = await usecase(Params(offsetNumber));
      // Assert
      expect(result, pokemonNameList);
      verify(mockPokemonRepository.getPokemonList(offsetNumber));
      verifyNoMoreInteractions(mockPokemonRepository);
    });
  });
}
