part of 'pokemonlist_bloc.dart';

abstract class PokemonlistState extends Equatable {
  const PokemonlistState();
}

class EmptyState extends PokemonlistState {
  @override
  List<Object> get props => [null];
}

class Loading extends PokemonlistState {
  @override
  List<Object> get props => null;
}

class Listing extends PokemonlistState {
  final String url;
  final PokemonNameListEntity pokemonNameList;

  Listing({@required this.pokemonNameList, @required this.url});

  @override
  List<Object> get props => [pokemonNameList, url];
}

class ErrorState extends PokemonlistState {
  final String error;

  ErrorState(this.error);

  @override
  List<Object> get props => [error];
}
