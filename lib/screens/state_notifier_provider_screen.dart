
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/riverpod/state_notifier_provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state= ref.watch(userProfileListProvider);
    return Scaffold(
      body: ListView(children:
          state.map((e) => Text(e.userName)).toList()
      ),
    );
  }
}
