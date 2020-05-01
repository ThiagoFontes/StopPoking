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

  final String firstListURL =
      'https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20';
  final String lastListURL =
      'https://pokeapi.co/api/v2/pokemon/?offset=640&limit=20';

  final PokemonNameListEntity pokemonNameList =
      PokemonNameListEntity(lastListURL, 964, [item]);

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

      verify(mockGetPokemonList(Params(url: firstListURL)));
    });

    test("Should emit empty state, loading and First list retrieved", () {
      when(mockGetPokemonList(Params(url: firstListURL)))
          .thenAnswer((_) async => pokemonNameListEntity);

      final expected = [
        EmptyState(),
        Loading(),
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
        Loading(),
        ErrorState(url: firstListURL, error: "erro"),
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
        Listing(
          pokemonNameList: pokemonNameListEntity,
          url: lastListURL,
        ),
      ];

      expectLater(bloc, emitsInOrder(expected));

      bloc.add(GetPagedListOfPokemons(url: firstListURL));
    });

    test("Should emit a Loaded state", () {
      final PokemonNameListEntity lastPokemonNameListEntity =
          PokemonNameListEntity(null, 964, [item]);

      when(mockGetPokemonList(Params(url: lastListURL)))
          .thenAnswer((_) async => lastPokemonNameListEntity);

      final expected = [
        EmptyState(),
        Loaded(pokemonNameList: lastPokemonNameListEntity),
      ];

      expectLater(bloc, emitsInOrder(expected));

      bloc.add(GetPagedListOfPokemons(url: lastListURL));
    });
  });
}
