import 'package:flutter/material.dart';
import 'package:riverpod_playground/layout/default_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
    title: "Homescreen",
    body: ListView(
      children: [

      ],
    ));
  }
}
