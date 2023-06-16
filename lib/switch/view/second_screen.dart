import 'package:countswitch/l10n/l10n.dart';
import 'package:countswitch/switch/switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.secondScreen)),
      body: const Content(),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.select((SwitchCubit cubit) => cubit.state);
    final theme = Theme.of(context);
    return Center(
      child: Text(
        value ? 'Hello world' : 'Bye world',
        style: theme.textTheme.displaySmall,
      ),
    );
  }
}
