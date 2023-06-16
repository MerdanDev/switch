import 'package:bloc_test/bloc_test.dart';
import 'package:countswitch/switch/switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockCounterCubit extends MockCubit<bool> implements SwitchCubit {}

void main() {
  group('CounterPage', () {
    testWidgets('renders CounterView', (tester) async {
      await tester.pumpApp(const FirstScreen());
      expect(find.byType(FirstScreen), findsOneWidget);
    });
  });

  group('CounterView', () {
    late SwitchCubit counterCubit;

    setUp(() {
      counterCubit = MockCounterCubit();
    });

    testWidgets('renders current count', (tester) async {
      const state = true;
      when(() => counterCubit.state).thenReturn(state);
      await tester.pumpApp(
        BlocProvider.value(
          value: counterCubit,
          child: const FirstScreen(),
        ),
      );
      expect(find.text('$state'), findsOneWidget);
    });
  });
}
