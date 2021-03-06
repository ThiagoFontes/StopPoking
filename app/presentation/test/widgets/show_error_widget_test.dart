import 'package:flutter_test/flutter_test.dart';
import 'package:presentation/widgets/show_error_widget.dart';
import 'tester_extensions.dart';

import 'widget_tester_app.dart';

void main() {
  testWidgets('Widget golden test', (WidgetTester tester) async {
    await tester.setScreenSize(width: 414, height: 736);
    await tester.pumpWidget(
      WidgetTesterApp(
        child: ShowErrorWidget(
          message: 'Ops..',
          retryFunction: null,
        ),
      ),
    );

    await expectLater(
      find.byType(ShowErrorWidget),
      matchesGoldenFile('showErrorWidget.png'),
    );
  });
}
