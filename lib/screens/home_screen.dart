import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/layout/default_layout.dart';
import 'package:riverpod_playground/riverpod/future_provider.dart';
import 'package:riverpod_playground/screens/state_notifier_provider_screen.dart';
import 'package:riverpod_playground/screens/state_provider_screen.dart';

import '../riverpod/stream_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state= ref.watch(futureProvider(3));

    return DefaultLayout(
      title: "Home screen",
      body: ListView(
        children: [
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StateNotifierProviderScreen()));
            },
              child: const Text("StateProviderScreen")),
          state.when(
            data: (data) {
              return Text(data.toString());
          }, error: (err, stack) {
            return Text(err.toString());
          }, loading: () {
            return const LinearProgressIndicator(minHeight: 30,);
          })
        ],
      ));
  }
}
