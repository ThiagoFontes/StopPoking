import 'dart:io';

import 'package:data/model/pokemon.dart';
import 'package:test/test.dart';

void main() {
  group("Pokemons Parsing", () {
    test("Parses a json pokemon", () {
      const jsonStr = """{
    "id": 12,
    "name": "butterfree"
    }""";

      expect(parsePokemon(jsonStr).name, "butterfree");
    });

    test("Parses another pokemon", () async {
      final File file = new File('test/mock/charmander.json');
      final String jsonStr = await file.readAsString();
      Pokemon charmander = parsePokemon(jsonStr);
      expect(charmander.name, "charmander");
      expect(charmander.types.first.type.name, "fire");
    });
  });
}
