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

class GetFirstPageListOfPokemons extends PokemonlistEvent {
  final String url = 'https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20';

  GetFirstPageListOfPokemons();

  @override
  List<Object> get props => [url];
}
