import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/constants/app_sizes.dart';
import 'package:riverpod_playground/layout/default_layout.dart';

class DetailDescScreen extends ConsumerWidget {
  const DetailDescScreen(this.title, this.what, this.where, this.when, {Key? key}) : super(key: key);
  final String title;
  final String what;
  final String where;
  final String when;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return DefaultLayout(title: title,
        body: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("what", style: TextStyle(fontSize: 23)).tr(),
                Text(what),
                gapH20,

                const Text("where", style: TextStyle(fontSize: 23)).tr(),
                Text(where),
                gapH20,

                const Text("when", style: TextStyle(fontSize: 23)).tr(),
                Text(when),
                gapH20,
            ],),
          ),
        ));
  }
}
