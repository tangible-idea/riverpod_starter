
import 'package:flutter_riverpod/flutter_riverpod.dart';

FutureProvider<int> futureProvider = FutureProvider((ref) async {
  await Future.delayed(const Duration(seconds: 2));
  return 42;
});