import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/entities.dart';
import 'package:domain/usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

// EVENT -> BLOC -> STATE

class PokemonlistBloc extends Bloc<PokemonlistEvent, PokemonlistState> {
  final GetPokemonListUseCase getPokemonList;

  PokemonlistBloc({
    @required GetPokemonListUseCase getList,
  })  : assert(getList != null),
        getPokemonList = getList;

  @override
  PokemonlistState get initialState => EmptyState();

  @override
  Stream<PokemonlistState> mapEventToState(
    PokemonlistEvent event,
  ) async* {
    PokemonNameListEntity updatedPokemonList;

    try {
      if (event is GetFirstPageListOfPokemons) {
        yield Loading();

        final PokemonNameListEntity pokemonList =
            await getPokemonList(Params(url: event.url));

        yield Listing(pokemonNameList: pokemonList, url: pokemonList.next);
      } else if (event is GetPagedListOfPokemons) {
        final PokemonNameListEntity pokemonList =
            await getPokemonList(Params(url: event.url));
        updatedPokemonList = PokemonNameListEntity(
          pokemonList.next,
          pokemonList.count,
          event.currentPokemonNameList,
        );
        updatedPokemonList.results.addAll(pokemonList.results);

        if (pokemonList.next != null) {
          yield Listing(
            pokemonNameList: updatedPokemonList,
            url: pokemonList.next,
          );
        } else {
          yield Loaded(pokemonNameList: updatedPokemonList);
        }
      }
    } catch (e) {
      yield ErrorState(
        url: (event as GetPagedListOfPokemons).url,
        error: "erro",
      );
    }
  }
}
