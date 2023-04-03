import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/layout/default_layout.dart';
import 'package:riverpod_playground/riverpod/future_provider.dart';
import 'package:riverpod_playground/screens/future_provider_screen.dart';
import 'package:riverpod_playground/screens/state_notifier_provider_screen.dart';
import 'package:riverpod_playground/screens/state_provider_screen.dart';

import '../riverpod/stream_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return DefaultLayout(
      title: "Home screen",
      body: ListView(
        children: [
            ElevatedButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StateProviderScreen()));
              },
              child: const Text("Just a simple StateProvider")
            ),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StateNotifierProviderScreen()));
            },
                child: const Text("How to use StateNotifierProvider")
            ),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FutureProviderScreen()));
            },
                child: const Text("How to use FutureProvider")
            ),
        ],
      ));
  }
}
