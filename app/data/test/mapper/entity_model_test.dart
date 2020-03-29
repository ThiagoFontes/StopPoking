import 'dart:convert';

import 'package:data/mapper/pokemon_mapper.dart';
import 'package:data/model/pokemon.dart';
import 'package:domain/entities.dart';
import 'package:test/test.dart';

import '../mock/mock_reader.dart';

void main() {
  group(
    "Mapping to entity",
    () {
      test(
        "Test mapping with charmander",
        () {
          PokemonModel charmander =
              PokemonModel.fromJson(jsonDecode(mock('charmander.json')));
          PokemonEntity pokemonEntity = mapToPokemonEntity(charmander);

          expect(pokemonEntity.name, "charmander");
        },
      );
    },
  );
}
