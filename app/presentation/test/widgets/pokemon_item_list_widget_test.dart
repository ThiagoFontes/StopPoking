import 'package:flutter_test/flutter_test.dart';
import 'package:presentation/widgets/pokemon_item_list_widget.dart';

import 'widget_tester_app.dart';

void main() {
  testWidgets('Widget golden test', (WidgetTester tester) async {
    await tester.pumpWidget(
      WidgetTesterApp(
        child: PokemonItemWidget(
          name: 'bulbasaur',
          pokedexNumber: 1,
        ),
      ),
    );

    await expectLater(find.byType(PokemonItemWidget),
        matchesGoldenFile('pokemonItenWidget.png'));
  });
}
