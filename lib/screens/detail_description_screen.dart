import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/constants/app_sizes.dart';
import 'package:riverpod_playground/layout/default_layout.dart';

import '../constants/text_styles.dart';

class DetailDescScreen extends StatelessWidget {
  const DetailDescScreen(this.title, this.what, this.where, this.when, {Key? key}) : super(key: key);
  final String title;
  final String what;
  final String where;
  final String when;

  @override
  Widget build(BuildContext context) {

    return DefaultLayout(
        title: title,
        body: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("what", style: TextStyles.styleHeader).tr(),
                Text(what, style: TextStyles.styleContent),
                gapH20,

                const Text("where", style: TextStyles.styleHeader).tr(),
                Text(where, style: TextStyles.styleContent),
                gapH20,

                const Text("when", style: TextStyles.styleHeader).tr(),
                Text(when, style: TextStyles.styleContent),
                gapH20,
            ],),
          ),
        ));
  }
}
