import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/constants/app_sizes.dart';
import 'package:riverpod_playground/layout/default_layout.dart';

class SimpleDescScreen extends ConsumerWidget {
  const SimpleDescScreen(this.title, this.desc, {Key? key}) : super(key: key);
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return DefaultLayout(title: title,
        body: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(desc),
                gapH20,
            ],),
          ),
        ));
  }
}
