part of 'pokemon_list_bloc.dart';

abstract class PokemonlistEvent extends Equatable {
  const PokemonlistEvent();
}

class GetPagedListOfPokemons extends PokemonlistEvent {
  const GetPagedListOfPokemons(
      {@required this.url, @required this.currentPokemonNameList});
  final String url;
  final List<PokemonNameItemEntity> currentPokemonNameList;

  @override
  List<Object> get props => [url, currentPokemonNameList];
}

class GetFirstPageListOfPokemons extends GetPagedListOfPokemons {
  final String url = 'https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20';

  GetFirstPageListOfPokemons();

  @override
  List<Object> get props => [url];
}
