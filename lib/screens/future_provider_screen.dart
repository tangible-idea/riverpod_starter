import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/layout/default_layout.dart';
import 'package:riverpod_playground/riverpod/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(futureProvider(3));

    return DefaultLayout(
      title: "FutureProviderScreen",
      body: state.when(
        data: (data) {
          return Text(data.toString());
        },
        error: (err, stack) {
          return Text(err.toString());
        },
        loading: () {
          return const LinearProgressIndicator(
            minHeight: 30,
          );
        },
      ),
    );
  }
}
