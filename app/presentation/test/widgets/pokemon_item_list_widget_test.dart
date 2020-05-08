import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:presentation/widgets/pokemon_item_list_widget.dart';

void main() {
  testWidgets('Widget golden test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PokemonItemWidget(
          name: 'bulbasaur',
          pokedexNumber: 1,
        ),
      ),
    ));

    await expectLater(find.byType(PokemonItemWidget),
        matchesGoldenFile('pokemonItenWidget.png'));
  });
}
