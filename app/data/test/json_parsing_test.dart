import 'package:data/model/pokemon.dart';
import 'package:data/model/pokemon_name_list.dart';
import 'dart:convert' as json;
import 'package:test/test.dart';

import 'mock/mock_reader.dart';

void main() {
  group("Pokemons Parsing", () {
    test("Parses a json pokemon", () {
      const jsonStr = """{
    "id": 12,
    "name": "butterfree"
    }""";

      expect(
          PokemonModel.fromJson(json.jsonDecode(jsonStr)).name, "butterfree");
    });

    test("Parses another pokemon", () async {
      PokemonModel charmander =
          PokemonModel.fromJson(json.jsonDecode(mock('charmander.json')));
      expect(charmander.name, "charmander");
      expect(charmander.types.first.type.name, "fire");
      expect(charmander.moves[2].move.name, "thunder-punch");
      expect(charmander.height, 6);
    });

    test("Parses a list of pokemons", () async {
      PokemonNamesList pokemonList = PokemonNamesList.fromJson(
          json.jsonDecode(mock('pokemon_list_final.json')));

      expect(pokemonList.count, 964);
      expect(pokemonList.next, null);
      expect(pokemonList.results.first.name, "togedemaru-totem");
    });
  });
}
