import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/constants/app_sizes.dart';
import 'package:riverpod_playground/layout/default_layout.dart';
import 'package:riverpod_playground/riverpod/simple_state_provider.dart';

import '../generated/assets.dart';

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
              Image.asset(Assets.codesImgStateprovider),
              Text("simple_state_provider_1".tr()),
              gapH20,
              Image.asset(Assets.codesImgStateproviderscreen),
              Text("simple_state_provider_2".tr()),
              Text("simple_state_provider_3".tr()),
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
