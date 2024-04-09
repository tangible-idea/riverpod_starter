

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/layout/default_layout.dart';
import 'package:riverpod_playground/riverpod/listen_provider.dart';

import '../constants/app_sizes.dart';
import '../constants/text_styles.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({super.key});

  @override
  ConsumerState<ListenProviderScreen> createState() => _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen> with TickerProviderStateMixin {
  late final TabController controller;
  static const TAB_COUNT= 5;

  @override
  void initState() {
    super.initState();

    controller= TabController(
        length: TAB_COUNT,
        vsync: this,
        initialIndex: ref.read(listenProvider)
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(listenProvider, (previous, next) {
      if (kDebugMode) {
        print(previous);
        print(next);
      }

      if(previous != next) {
        controller.animateTo(next);
      }
    });

    return DefaultLayout(title: 'ListenProviderScreen',
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH20,

              const Text("what", style: TextStyles.styleHeader).tr(),
              const Text('listen_detail', style: TextStyles.styleContent).tr(),
              gapH20,

              const Text("where", style: TextStyles.styleHeader).tr(),
              const Text('listen_where', style: TextStyles.styleContent).tr(),
              gapH20,

              const Text("when", style: TextStyles.styleHeader).tr(),
              const Text('listen_when', style: TextStyles.styleContent).tr(),
              gapH20,

              Flexible(
                child: TabBarView(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(TAB_COUNT, (index) =>
                      Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(index.toString()),
                          ElevatedButton(onPressed: () {
                            ref.read(listenProvider.notifier).update((state) => state == 0 ? 0: state - 1);
                          }, child: const Text("prev").tr()),
                          ElevatedButton(onPressed: () {
                            ref.read(listenProvider.notifier).update((state) => state == TAB_COUNT ? TAB_COUNT : state + 1);
                          }, child: const Text("next").tr())
                        ]
                )
                  )),
              ),
          ]),
        ));
  }
}
