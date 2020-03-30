part of 'pokemonlist_bloc.dart';

abstract class PokemonlistState extends Equatable {
  const PokemonlistState();
}

class PokemonlistInitial extends PokemonlistState {
  @override
  List<Object> get props => [];
}

class EmptyState extends PokemonlistState {
  @override
  List<Object> get props => null;
}

class Loading extends PokemonlistState {
  @override
  List<Object> get props => null;
}

class ShowingList extends PokemonlistState {
  final int offset;
  final PokemonNameListEntity pokemonNameList;

  ShowingList({@required this.pokemonNameList, @required this.offset});

  @override
  List<Object> get props => [pokemonNameList, offset];
}

class ErrorState extends PokemonlistState {
  final String error;

  ErrorState(this.error);

  @override
  List<Object> get props => [error];
}
