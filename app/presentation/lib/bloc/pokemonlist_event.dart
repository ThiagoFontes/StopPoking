part of 'pokemonlist_bloc.dart';

abstract class PokemonlistEvent extends Equatable {
  const PokemonlistEvent();
}

class GetPagedListOfPokemons extends PokemonlistEvent {
  final String url;

  const GetPagedListOfPokemons({@required this.url});

  @override
  List<Object> get props => [url];
}
