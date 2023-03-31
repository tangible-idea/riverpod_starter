

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/model/user_profile_item.dart';

/// StateNotifierProvider
///
/// Generic1: What type of Notifier it is.
/// Generic2: What class should this notifier manage.
/// return: Same as Generic2.
final userProfileListProvider = StateNotifierProvider<UserProfileNotifier, List<UserProfileItem>>
  ((ref) => UserProfileNotifier());

class UserProfileNotifier extends StateNotifier<List<UserProfileItem>> {
  UserProfileNotifier():
      super([
        UserProfileItem(userName: 'userName', age: 30, gender: "M")
      ]);

  void changeUserName({required String name, required String nameToChange}) {
    state= state.map((e) => e.userName == name ?
      UserProfileItem(userName: e.userName, age: e.age, gender: e.gender) :
      UserProfileItem(userName: nameToChange, age: e.age, gender: e.gender)).toList();
  }


}