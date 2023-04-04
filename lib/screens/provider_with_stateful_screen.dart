import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderWithStatefulScreen extends ConsumerStatefulWidget {
  const ProviderWithStatefulScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProviderWithStatefulScreen> createState() => _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ProviderWithStatefulScreen> with TickerProviderStateMixin{
  late final TabController controller;

  @override
  void initState() {
    super.initState();

    controller= TabController(length: 10, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
