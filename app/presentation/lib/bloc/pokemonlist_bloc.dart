import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/entities.dart';
import 'package:domain/usecases/pokemon_list.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'pokemonlist_event.dart';
part 'pokemonlist_state.dart';

// EVENT -> BLOC -> STATE

class PokemonlistBloc extends Bloc<PokemonlistEvent, PokemonlistState> {
  final GetPokemonList getPokemonList;

  PokemonlistBloc({
    @required GetPokemonList getList,
  })  : assert(getList != null),
        getPokemonList = getList;

  @override
  PokemonlistState get initialState => PokemonlistInitial();

  @override
  Stream<PokemonlistState> mapEventToState(
    PokemonlistEvent event,
  ) async* {
    if (event is GetPagedListOfPokemons) {
      getPokemonList(Params(offset: event.offset));
    }
  }
}
