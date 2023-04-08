
import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProviderWithParam = FutureProvider.family<String, String>((ref, data) async {
  await Future.delayed(const Duration(seconds: 2));
  return "Call from https://yourapi.com/$data";
});

