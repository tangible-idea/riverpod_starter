

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/layout/default_layout.dart';
import 'package:riverpod_playground/riverpod/listen_provider.dart';

import '../constants/app_sizes.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({super.key});

  @override
  ConsumerState<ListenProviderScreen> createState() => _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen> with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();

    controller= TabController(
        length: 10,
        vsync: this,
        initialIndex: ref.read(listenProvider)
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(listenProvider, (previous, next) {
      print(previous);
      print(next);
      if(previous != next) {
        controller.animateTo(next);
      }
    });

    return DefaultLayout(title: 'ListenProviderScreen',
        body: Column(
          children: [
            const Text("what", style: TextStyle(fontSize: 23)).tr(),
            const Text('listen_detail').tr(),
            gapH20,

            const Text("where", style: TextStyle(fontSize: 23)).tr(),
            const Text('listen_where').tr(),
            gapH20,

            const Text("when", style: TextStyle(fontSize: 23)).tr(),
            const Text('listen_when').tr(),
            gapH20,

            Flexible(
              child: TabBarView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
                children: List.generate(10, (index) =>
                    Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(index.toString()),
                        ElevatedButton(onPressed: () {
                          ref.read(listenProvider.notifier).update((state) => state == 0 ? 0: state - 1);
                        }, child: const Text("prev").tr()),
                        ElevatedButton(onPressed: () {
                          ref.read(listenProvider.notifier).update((state) => state == 10 ? 10 : state + 1);
                        }, child: const Text("next").tr())
                      ]
              )
                )),
            ),
        ]));
  }
}
