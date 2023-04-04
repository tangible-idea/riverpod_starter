import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/constants/app_sizes.dart';
import 'package:riverpod_playground/layout/default_layout.dart';
import 'package:riverpod_playground/riverpod/simple_state_provider.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider= ref.watch(numberProvider);

    return DefaultLayout(title: "Just a simple StateProvider",
        body: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/codes/img_stateprovider.png"),
              const Text("\nThere are many ways to use StateProvider. But the most common way is to use it as a simple state management."),
              gapH20,
              Image.asset("assets/codes/img_stateproviderscreen.png"),
              const Text("\nPress UP: update the state by adding 1\nPress DOWN: update the state by subtracting 1 (use state 2times.)"),
              const Text("\nTry press UP or DOWN button to change the number."),
              gapH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                ElevatedButton(
                    onPressed: () {
                      ref.read(numberProvider.notifier).update((state) => state + 1);
                    }, child: const Text("UP")),
                gapW8,
                ElevatedButton(
                    onPressed: () {
                      ref.read(numberProvider.notifier).state =
                          ref.read(numberProvider.notifier).state -1;
                    }, child: const Text("DOWN")),
                gapW20,
                Text(provider.toString(), style: const TextStyle(fontSize: 24))
              ],),

          ],),
        ));
  }
}
