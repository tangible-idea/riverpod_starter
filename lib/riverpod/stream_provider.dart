import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_profile_item.dart';

StreamProvider<List<int>> numberStreamProvider = StreamProvider((ref) async* {

  for(var i=0; i<10; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield [i*3];
  }
});

StreamProvider<List<UserProfileItem>> userStreamProvider =
    StreamProvider((ref) async* {

  await Future.delayed(const Duration(seconds: 2));
  yield [
    UserProfileItem(id: '1', userName: 'John', isPremium: false, age: 30, gender: 'M'),
    UserProfileItem(id: '2', userName: 'Jane', isPremium: false, age: 30, gender: 'M'),
    UserProfileItem(id: '3', userName: 'Jack', isPremium: false, age: 30, gender: 'M'),
  ];
});