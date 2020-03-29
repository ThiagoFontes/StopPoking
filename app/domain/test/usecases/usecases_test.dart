import 'dart:io';

import 'package:domain/entity/pokemon_name_item.dart';
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

  PokemonNameItem item = PokemonNameItem(
      name: "togedemaru-totem",
      url: "https://pokeapi.co/api/v2/pokemon/10154/");
  final List<PokemonNameItem> pokemonNameList = [item];

  group("Pokemons List tests with mocks", () {
    test("Get final list of pokemons (offset 960)", () async {
      // Arrange
      when(mockPokemonRepository.getPokemonList(offsetNumber))
          .thenAnswer((_) async => pokemonNameList);
      // Act
      final result = await usecase.execute(number: offsetNumber);
      // Assert
      expect(result, pokemonNameList);
      verify(mockPokemonRepository.getPokemonList(offsetNumber));
      verifyNoMoreInteractions(mockPokemonRepository);
    });
  });
}
