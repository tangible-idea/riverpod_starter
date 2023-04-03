import 'package:code_viewer/code_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/layout/default_layout.dart';
import 'package:riverpod_playground/riverpod/simple_state_provider.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider= ref.watch(numberProvider);

    return DefaultLayout(title: "state provider screen",
        body: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref.read(numberProvider.notifier).update((state) => state + 1);
              }, child: Text("UP")),
              ElevatedButton(
                  onPressed: () {
                    ref.read(numberProvider.notifier).state =
                        ref.read(numberProvider.notifier).state -1;
                  }, child: Text("DOWN")),
              Text(provider.toString())
          ],),
        ));
  }
}
