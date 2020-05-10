import 'package:domain/entities.dart';
import 'package:domain/usecases/pokemon_list.dart';
import 'package:core/exception.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:presentation/bloc/pokemon_list_bloc.dart';

class MockGetPokemonList extends Mock implements GetPokemonListUseCase {}

void main() {
  PokemonlistBloc bloc;
  MockGetPokemonList mockGetPokemonList;

  PokemonNameItemEntity item = PokemonNameItemEntity(
      name: "togedemaru-totem",
      url: "https://pokeapi.co/api/v2/pokemon/10154/");

  PokemonNameItemEntity item2 = PokemonNameItemEntity(
      name: "poke2", url: "https://pokeapi.co/api/v2/pokemon/10155/");

  final String firstListURL =
      'https://pokeapi.co/api/v2/pokemon/?offset=0&limit=40';
  final String lastListURL =
      'https://pokeapi.co/api/v2/pokemon/?offset=640&limit=40';

  final PokemonNameListEntity pokemonNameList =
      PokemonNameListEntity(lastListURL, 964, [item]);

  final PokemonNameListEntity lastPokemonNameListEntity =
      PokemonNameListEntity(null, 964, [item2]);

  final List<PokemonNameItemEntity> emptyList = [];

  setUp(() {
    mockGetPokemonList = MockGetPokemonList();
    bloc = PokemonlistBloc(getList: mockGetPokemonList);
  });

  group("Block test", () {
    test("Initial state should be empty", () {
      expect(bloc.initialState, EmptyState());
    });
  });

  group("Get initial list", () {
    final PokemonNameListEntity pokemonNameListEntity = pokemonNameList;

    test("Should call usecase with 0 offset and has a next url", () async {
      when(mockGetPokemonList(Params(url: firstListURL)))
          .thenAnswer((_) async => pokemonNameListEntity);

      bloc.add(GetFirstPageListOfPokemons());
      await untilCalled(mockGetPokemonList(any));

      verify(mockGetPokemonList(Params(url: firstListURL))).called(1);
    });

    test("Should emit empty state, loading and First list retrieved", () {
      when(mockGetPokemonList(Params(url: firstListURL)))
          .thenAnswer((_) async => pokemonNameListEntity);

      final expected = [
        EmptyState(),
        Loading(currentPokemonList: []),
        Listing(
            pokemonNameList: pokemonNameListEntity,
            url: pokemonNameListEntity.next),
      ];

      expectLater(bloc, emitsInOrder(expected));

      bloc.add(GetFirstPageListOfPokemons());
    });

    test("Should emit empty state, loading and Error state in case of error",
        () {
      when(mockGetPokemonList(Params(url: firstListURL)))
          .thenThrow((_) async => ServerException());

      final expected = [
        EmptyState(),
        Loading(currentPokemonList: []),
        ErrorState(
          url: firstListURL,
          pokemonNameList: [],
          error: "erro",
        ),
      ];

      expectLater(bloc, emitsInOrder(expected));

      bloc.add(GetFirstPageListOfPokemons());
    });
  });

  group('Fetching next lists of pokemons', () {
    final PokemonNameListEntity pokemonNameListEntity = pokemonNameList;
    test("Should emit a new listing state", () {
      when(mockGetPokemonList(Params(url: firstListURL)))
          .thenAnswer((_) async => pokemonNameListEntity);

      final expected = [
        EmptyState(),
        Loading(currentPokemonList: emptyList),
        Listing(
          pokemonNameList: pokemonNameListEntity,
          url: lastListURL,
        ),
      ];

      expectLater(bloc, emitsInOrder(expected));

      bloc.add(
        GetPagedListOfPokemons(
          url: firstListURL,
          currentPokemonNameList: emptyList,
        ),
      );
    });

    test("Should emit a Loaded state", () {
      when(mockGetPokemonList(Params(url: lastListURL)))
          .thenAnswer((_) async => lastPokemonNameListEntity);

      final expected = [
        EmptyState(),
        Loading(currentPokemonList: lastPokemonNameListEntity.results),
        Loaded(pokemonNameList: lastPokemonNameListEntity),
      ];

      expectLater(bloc, emitsInOrder(expected));

      bloc.add(
        GetPagedListOfPokemons(
          url: lastListURL,
          currentPokemonNameList: [],
        ),
      );
    });

    test('Should not concatenate if the same list is returned', () {
      when(mockGetPokemonList(Params(url: lastListURL)))
          .thenAnswer((_) async => pokemonNameList);

      final expected = [
        EmptyState(),
        Loading(currentPokemonList: pokemonNameList.results),
        Listing(
          pokemonNameList: pokemonNameList,
          url: lastListURL,
        ),
      ];

      expectLater(bloc, emitsInOrder(expected));

      bloc.add(
        GetPagedListOfPokemons(
          url: lastListURL,
          currentPokemonNameList: pokemonNameList.results,
        ),
      );
    });

    test('Should concatenate responses when received', () {
      when(mockGetPokemonList(Params(url: lastListURL)))
          .thenAnswer((_) async => lastPokemonNameListEntity);

      final PokemonNameListEntity concatenatedList = PokemonNameListEntity(
        lastPokemonNameListEntity.next,
        lastPokemonNameListEntity.count,
        pokemonNameList.results,
      );

      concatenatedList.results.addAll(lastPokemonNameListEntity.results);

      final expected = [
        EmptyState(),
        Loading(currentPokemonList: pokemonNameList.results),
        Loaded(pokemonNameList: concatenatedList),
      ];

      expectLater(bloc, emitsInOrder(expected));

      bloc.add(
        GetPagedListOfPokemons(
          currentPokemonNameList: pokemonNameList.results,
          url: lastListURL,
        ),
      );
    });
  });
}
