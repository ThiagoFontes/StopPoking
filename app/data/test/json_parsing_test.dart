import 'dart:io';

import 'package:data/model/pokemon.dart';
import 'package:data/model/pokemon_name_list.dart';
import 'dart:convert' as json;
import 'package:test/test.dart';

void main() {
  group("Pokemons Parsing", () {
    test("Parses a json pokemon", () {
      const jsonStr = """{
    "id": 12,
    "name": "butterfree"
    }""";

      expect(Pokemon.fromJson(json.jsonDecode(jsonStr)).name, "butterfree");
    });

    test("Parses another pokemon", () async {
      final File file = new File("test/mock/charmander.json");
      final String jsonStr = await file.readAsString();
      Pokemon charmander = Pokemon.fromJson(json.jsonDecode(jsonStr));
      expect(charmander.name, "charmander");
      expect(charmander.types.first.type.name, "fire");
      expect(charmander.moves[2].move.name, "thunder-punch");
      expect(charmander.height, 6);
    });

    test("Parses a list of pokemons", () async {
      final File file = new File("test/mock/pokemon_list_final.json");
      final String jsonStr = await file.readAsString();
      PokemonNamesList pokemonList = PokemonNamesList.fromJson(json.jsonDecode(jsonStr));

      expect(pokemonList.count, 964);
      expect(pokemonList.next, null);
      expect(pokemonList.results.first.name, "togedemaru-totem");
    });
  });
}
