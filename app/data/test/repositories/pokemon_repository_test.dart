import 'dart:convert';

import 'package:core/network/network_info.dart';
import 'package:data/datasources/pokeapi_pokemons.dart';
import 'package:data/model/pokemon_name_list.dart';
import 'package:data/repository/pokemon_repository.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:domain/entities/pokemon_name_list/pokemon_name_list.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../mock/mock_reader.dart';

class MockPokemonsRemoteDataSource extends Mock
    implements PokemonsRemoteDataSourceContract {}

class MockDataConnection extends Mock implements DataConnectionChecker{}

void main() {
  MockPokemonsRemoteDataSource mockPokemonsRemoteDataSource;
  NetworkInfo networkInfo;
  MockDataConnection mockDataConnection;
  PokemonRepository pokemonRepository;

  setUp(() {
    mockPokemonsRemoteDataSource = MockPokemonsRemoteDataSource();
    mockDataConnection = MockDataConnection();
    networkInfo = NetworkInfo(mockDataConnection);
    pokemonRepository = PokemonRepository(
      pokemonsRemoteDataSource: mockPokemonsRemoteDataSource,
      networkInfo: networkInfo
    );
  });

  group("Pokemon Repository tests", () {
    final PokemonNamesList pokemonList =
        PokemonNamesList.fromJson(jsonDecode(mock('pokemon_list_final.json')));
    final PokemonNameListEntity entity = pokemonList;

    test('Test fetching list of pokemons', () async {
      // arrange
      final offset = 960;
      when(mockDataConnection.hasConnection).thenAnswer((_) async => true);
      when(mockPokemonsRemoteDataSource.getPokemonList(any))
          .thenAnswer((_) async => pokemonList);
      //Todo Check network
      // act
      final result = await pokemonRepository.getPokemonList(offset);
      // assert
      verify(mockPokemonsRemoteDataSource.getPokemonList(offset));
      expect(result, entity);
    });
  });
}
