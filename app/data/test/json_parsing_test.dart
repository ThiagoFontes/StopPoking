import 'dart:io';

import 'package:data/entity/pokemon.dart';
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
      final File file = new File('test/mock/charmander.json');
      final String jsonStr = await file.readAsString();
      Pokemon charmander = Pokemon.fromJson(json.jsonDecode(jsonStr));
      expect(charmander.name, "charmander");
      expect(charmander.types.first.type.name, "fire");
      expect(charmander.moves[2].move.name, "thunder-punch");
    });
  });
}
