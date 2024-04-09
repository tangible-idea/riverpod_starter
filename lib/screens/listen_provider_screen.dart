

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/layout/default_layout.dart';

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

    controller= TabController(length: 10, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(title: 'ListenProviderScreen',
        body: TabBarView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
            children: List.generate(10, (index) =>
                Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(index.toString()),
                    ElevatedButton(onPressed: () {}, child: const Text("prev").tr()),
                    ElevatedButton(onPressed: () {}, child: const Text("next").tr())
                  ]
          )
    )));
  }
}
