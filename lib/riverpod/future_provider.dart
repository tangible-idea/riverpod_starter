
import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider.family<int, int>((ref, data) async {
  await Future.delayed(const Duration(seconds: 2));
  return 42*data;
});