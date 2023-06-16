import 'package:countswitch/l10n/l10n.dart';
import 'package:countswitch/switch/switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.select((SwitchCubit cubit) => cubit.state);
    return MaterialApp(
      theme: value ? ThemeData.light() : ThemeData.dark(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const FirstScreen(),
    );
  }
}
