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
    if (event is GetFirstPageListOfPokemons) {
      yield Loading();
      try {
        yield await listPokemons(event);
      } catch (e) {
        yield ErrorState(url: event.url, error: "erro");
      }
    } else if (event is GetPagedListOfPokemons) {
      try {
        if (event.url != null) {
          yield await listPokemons(event);
        }
      } catch (e) {
        yield ErrorState(url: event.url, error: "erro");
      }
    }
  }

  Future<PokemonlistState> listPokemons(PokemonlistEvent event) async {
    final PokemonNameListEntity pokemonList = await getPokemonList(
        Params(url: (event as GetPagedListOfPokemons).url));
    if (pokemonList.next != null) {
      return Listing(pokemonNameList: pokemonList, url: pokemonList.next);
    } else {
      return Loaded(pokemonNameList: pokemonList);
    }
  }
}
