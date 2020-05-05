part of 'pokemon_list_bloc.dart';

abstract class PokemonlistState extends Equatable {
  const PokemonlistState();
}

class EmptyState extends PokemonlistState {
  @override
  List<Object> get props => [null];
}

class Loading extends PokemonlistState {
  final List<PokemonNameItemEntity> currentPokemonList;

  Loading({@required this.currentPokemonList});

  @override
  List<Object> get props => [currentPokemonList];
}

class Listing extends PokemonlistState {
  final String url;
  final PokemonNameListEntity pokemonNameList;

  Listing({@required this.pokemonNameList, @required this.url});

  @override
  List<Object> get props => [pokemonNameList, url];
}

class Loaded extends PokemonlistState {
  final PokemonNameListEntity pokemonNameList;

  Loaded({@required this.pokemonNameList});

  @override
  List<Object> get props => [pokemonNameList];
}

class ErrorState extends PokemonlistState {
  final String error;
  final String url;

  ErrorState({@required this.error, @required this.url});

  @override
  List<Object> get props => [error, url];
}
