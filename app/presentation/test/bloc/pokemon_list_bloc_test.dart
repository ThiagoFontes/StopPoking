import 'package:domain/entities.dart';
import 'package:domain/usecases/pokemon_list.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:presentation/bloc/pokemonlist_bloc.dart';

class MockGetPokemonList extends Mock implements GetPokemonList {}

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
    final tOffset = 0;
    final PokemonNameListEntity pokemonNameListEntity = pokemonNameList;

    test("Should call usecase with 0 offset", () async {
      when(mockGetPokemonList(Params(0)))
          .thenAnswer((_) async => pokemonNameListEntity);

      bloc.add(GetPagedListOfPokemons(offset: 0));
      await untilCalled(mockGetPokemonList(any));

      verify(mockGetPokemonList(Params(0)));
    });
  });
}
