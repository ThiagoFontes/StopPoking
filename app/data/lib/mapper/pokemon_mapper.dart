import 'package:data/model/pokemon.dart';
import 'package:domain/entities.dart';

PokemonEntity mapToPokemonEntity(PokemonModel pokemonModel) {
  // final String map = json.jsonEncode(pokemonModel);
  // final PokemonEntity entity = json.jsonDecode(map);
  final PokemonEntity entity = PokemonEntity(
    id: pokemonModel.id,
    name: pokemonModel.name,
    height: pokemonModel.height,
    weight: pokemonModel.height,
    moves: pokemonModel.moves,
    types: pokemonModel.types,
  );
  return entity;
}
