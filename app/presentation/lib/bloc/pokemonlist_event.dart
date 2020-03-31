part of 'pokemonlist_bloc.dart';

abstract class PokemonlistEvent extends Equatable {
  const PokemonlistEvent();
}

class GetPagedListOfPokemons extends PokemonlistEvent {
  final int offset;

  const GetPagedListOfPokemons({@required this.offset});

  @override
  List<Object> get props => [offset];
}
