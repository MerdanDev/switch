import 'package:countswitch/app/app.dart';
import 'package:countswitch/switch/switch.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(FirstScreen), findsOneWidget);
    });
  });
}
