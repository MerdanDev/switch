import 'package:countswitch/l10n/l10n.dart';
import 'package:countswitch/switch/cubit/log_cubit.dart';
import 'package:countswitch/switch/switch.dart';
import 'package:countswitch/switch/view/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.firstScreen)),
      body: const Content(),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.select((SwitchCubit cubit) => cubit.state);
    final logs = context.select((LogCubit cubit) => cubit.state);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<Widget>(
                        builder: (context) {
                          return const SecondScreen();
                        },
                      ),
                    );
                  },
                  child: const Text('Open seconds screen'),
                ),
                Switch(
                  value: value,
                  onChanged: (value) {
                    context
                        .read<LogCubit>()
                        .addLog('$value: ${DateTime.now()}');
                    context.read<SwitchCubit>().toggleSwitch();
                  },
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverList.builder(
            itemBuilder: (context, index) {
              return Text(logs[index]);
            },
            itemCount: logs.length,
          ),
        )
      ],
    );
  }
}
