import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/layout/default_layout.dart';
import 'package:riverpod_playground/riverpod/future_provider.dart';
import 'package:riverpod_playground/screens/future_provider_screen.dart';
import 'package:riverpod_playground/screens/simple_description_screen.dart';
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
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) =>
                    const SimpleDescScreen("read()",
                        "read() is used to read the value of a provider."
                        "\nIt is used inside a ConsumerWidget's build method."
                        "\nread() is normally used in functions which is called single time.")));
            }, child: const Text("What is read()?")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) =>
                const SimpleDescScreen("watch()",
                    "watch() is used retrieving the value constantly form the provider."
                        "\nYou should use watch() only there is a need to rebuild the widget when the value changes.")));
              }, child: const Text("What is watch()?")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) =>
                const SimpleDescScreen("listen()",
                    "listen() is used when you want to listen the previous value and the current value at the same time."
                        "\nFor example, In a case when you need to show animation when by value changes.")));
              }, child: const Text("What is listen()?")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StateProviderScreen()));
            }, child: const Text("Just a simple StateProvider")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StateNotifierProviderScreen()));
            }, child: const Text("How to use StateNotifierProvider")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FutureProviderScreen()));
            }, child: const Text("How to use FutureProvider")
          ),
        ],
      ));
  }
}
