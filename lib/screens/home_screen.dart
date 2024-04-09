import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/layout/default_layout.dart';
import 'package:riverpod_playground/riverpod/future_provider.dart';
import 'package:riverpod_playground/screens/detail_description_screen.dart';
import 'package:riverpod_playground/screens/future_provider_screen.dart';
import 'package:riverpod_playground/screens/listen_provider_screen.dart';
import 'package:riverpod_playground/screens/simple_description_screen.dart';
import 'package:riverpod_playground/screens/state_notifier_provider_screen.dart';
import 'package:riverpod_playground/screens/state_provider_screen.dart';

import '../riverpod/stream_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void changeLang(BuildContext context) {
    var currLang= context.locale.toString();
    switch(currLang) {
      case "ko":
        context.setLocale(const Locale('en'));
        break;
      case "en":
        context.setLocale(const Locale('ko'));
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //context.setLocale(const Locale('en'));
    print(context.locale.toString());

    return DefaultLayout(
      title: "How to Riverpod",
      actions: [
          IconButton(
          icon: const Icon(Icons.language),
          onPressed: () async {
            changeLang(context);
          }),
        ],
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) =>
                    DetailDescScreen("read()",
                        'read_detail'.tr(), 'read_where'.tr(), 'read_when'.tr())));
            }, child: const Text('read').tr(),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) =>
                    DetailDescScreen("watch()",
                        'watch_detail'.tr(), 'watch_where'.tr(), 'watch_when'.tr())));
              }, child: const Text('watch').tr(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ListenProviderScreen()));
            }, child: const Text('listen').tr(),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StateProviderScreen()));
            }, child: const Text('simple_state_provider').tr(),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StateNotifierProviderScreen()));
            }, child: const Text('state_notifier_provider').tr(),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FutureProviderScreen()));
            }, child: const Text('future_provider').tr(),
          ),
        ],
      ));
  }
}
