import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/entities.dart';
import 'package:domain/usecases.dart';
import 'package:core/exception.dart';
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

    if (event is GetFirstPageListOfPokemons) {
      yield Loading(currentPokemonList: []);

      try {
        final PokemonNameListEntity pokemonList = await getPokemonList(
          Params(
            url: event.url,
          ),
        );

        yield Listing(
          pokemonNameList: pokemonList,
          url: pokemonList.next,
        );
      } catch (e) {
        yield _emitErrorState(e, [], event.url);
      }
    } else if (event is GetPagedListOfPokemons) {
      yield Loading(currentPokemonList: event.currentPokemonNameList);
      try {
        final PokemonNameListEntity pokemonList =
            await getPokemonList(Params(url: event.url));
        updatedPokemonList = PokemonNameListEntity(
          pokemonList.next,
          pokemonList.count,
          event.currentPokemonNameList,
        );

        //Checking if it was previously added
        bool wasAdded = updatedPokemonList.results.contains(
          pokemonList.results[0],
        );
        if (!wasAdded) {
          updatedPokemonList.results.addAll(pokemonList.results);
        }

        if (pokemonList.next != null) {
          yield Listing(
            pokemonNameList: updatedPokemonList,
            url: pokemonList.next,
          );
        } else {
          yield Loaded(pokemonNameList: updatedPokemonList);
        }
      } catch (e) {
        yield _emitErrorState(e, event.currentPokemonNameList, event.url);
      }
    }
  }

  ErrorState _emitErrorState(
    e,
    List<PokemonNameItemEntity> currentList,
    String nextUrl,
  ) {
    String errorMessage;
    if (e is NetworkException) {
      errorMessage = e.message;
    }
    return ErrorState(
      url: nextUrl != null ? nextUrl : GetFirstPageListOfPokemons().url,
      error: errorMessage != null ? errorMessage : "erro",
      pokemonNameList: currentList != null ? currentList : [],
    );
  }
}
