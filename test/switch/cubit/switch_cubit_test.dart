import 'package:bloc_test/bloc_test.dart';
import 'package:countswitch/switch/switch.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    test('initial state is true', () {
      expect(SwitchCubit().state, equals(true));
    });

    blocTest<SwitchCubit, bool>(
      'toggle switch method used to make [false]',
      build: SwitchCubit.new,
      act: (cubit) => cubit.toggleSwitch(),
      expect: () => [equals(false)],
    );

    blocTest<SwitchCubit, bool>(
      'toggle switch method used to make [true]',
      build: SwitchCubit.new,
      act: (cubit) {
        cubit
          ..toggleSwitch()
          ..toggleSwitch();
      },
      skip: 1,
      expect: () => [equals(true)],
    );
  });
}
