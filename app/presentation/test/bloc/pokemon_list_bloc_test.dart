import 'package:domain/entities.dart';
import 'package:domain/usecases/pokemon_list.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:presentation/bloc/pokemonlist_bloc.dart';

class MockGetPokemonList extends Mock implements GetPokemonListUseCase {}

void main() {
  PokemonlistBloc bloc;
  MockGetPokemonList mockGetPokemonList;

  PokemonNameItemEntity item = PokemonNameItemEntity(
      name: "togedemaru-totem",
      url: "https://pokeapi.co/api/v2/pokemon/10154/");
  final PokemonNameListEntity pokemonNameList =
      PokemonNameListEntity(null, 964, [item]);

  setUp(() {
    mockGetPokemonList = MockGetPokemonList();
    bloc = PokemonlistBloc(getList: mockGetPokemonList);
  });

  group("Block test", () {
    test("Initial state should be empty", () {
      expect(bloc.initialState, PokemonlistInitial());
    });
  });

  group("Get initial list", () {
    final String firstListURL =
        'https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20';
    final PokemonNameListEntity pokemonNameListEntity = pokemonNameList;

    test("Should call usecase with 0 offset", () async {
      when(mockGetPokemonList(Params(url: firstListURL)))
          .thenAnswer((_) async => pokemonNameListEntity);

      bloc.add(GetFirstPageListOfPokemons());
      await untilCalled(mockGetPokemonList(any));

      verify(mockGetPokemonList(Params(url: firstListURL)));
      bloc.close();
    });
  });
}
