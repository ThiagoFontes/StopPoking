import 'package:data/model/pokemon.dart';
import 'package:test/test.dart';

void main() {
  test("Parses a json pokemon", () {
    const jsonStr = """{
    "id": 12,
    "name": "butterfree"
    }""";

    expect(parsePokemon(jsonStr).name, "butterfree");
  });
}
