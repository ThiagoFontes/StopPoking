import 'dart:convert';

import 'package:data/datasources/pokeapi_pokemons.dart';
import 'package:data/model/pokemon_name_list.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:core/exception.dart';

import '../mock/mock_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  PokemonsRemoteDataSource dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = PokemonsRemoteDataSource(client: mockHttpClient);
  });

  void setUpMockHttpClientSucess() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(mock('pokemon_list_final.json'), 200));
  }

  void setUpMockHttpClientError() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(mock('pokemon_list_final.json'), 404));
  }

  group("Test http client", () {
    final String firstListURL =
        'https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20';
    final String nextListURL =
        'https://pokeapi.co/api/v2/pokemon/?offset=960&limit=20';

    final PokemonNamesList pokemonNamesList = PokemonNamesList.fromJson(
      jsonDecode(
        mock('pokemon_list_final.json'),
      ),
    );

    test('Should pass application/json ando peform get request', () async {
      setUpMockHttpClientSucess();

      dataSource.getPokemonList(nextListURL);

      verify(mockHttpClient.get(
        nextListURL,
        headers: {
          'Content-Type': 'application/json',
        },
      ));

      dataSource.getPokemonList(firstListURL);

      verify(mockHttpClient.get(
        firstListURL,
        headers: {
          'Content-Type': 'application/json',
        },
      ));
    });

    test('Should return list of pokemons when status is 200', () async {
      setUpMockHttpClientSucess();

      final response = await dataSource.getPokemonList(nextListURL);

      expect(response, pokemonNamesList);
    });

    test('Should throw an exception when stats is not 200', () async {
      setUpMockHttpClientError();

      final call = dataSource.getPokemonList;

      expect(() => call(nextListURL), throwsA(TypeMatcher<ServerException>()));
    });
  });
}
