

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/model/user_profile_item.dart';

/// StateNotifierProvider
///
/// Generic1: What type of Notifier it is.
/// Generic2: What class should this notifier manage.
/// return: Same as Generic2.
///
///
/// comment about this class
///
/// //
final userProfileListProvider = StateNotifierProvider<UserProfileNotifier, List<UserProfileItem>>
  ((ref) => UserProfileNotifier());

class UserProfileNotifier extends StateNotifier<List<UserProfileItem>> {
  UserProfileNotifier():
      super([
        UserProfileItem(id: 'a', userName: 'Mark', age: 30, gender: "M", isPremium: false),
        UserProfileItem(id: 'b', userName: 'Victor', age: 26, gender: "M", isPremium: true),
        UserProfileItem(id: 'c', userName: 'Wonny', age: 20, gender: "F", isPremium: false),
      ]);

  ///
  void changeUserName({required String id, required String nameToChange}) {
    state= state.map((e) => e.id == id ?
      UserProfileItem(id: e.id, userName: nameToChange, age: e.age, gender: e.gender, isPremium: e.isPremium) :
      UserProfileItem(id: e.id, userName: e.userName, age: e.age, gender: e.gender, isPremium: e.isPremium)).toList();
  }

  void changePremiumState({required String id}) {
    state= state.map((e) => e.id == id ?
    UserProfileItem(id: e.id, userName: e.userName, age: e.age, gender: e.gender, isPremium: !e.isPremium) :
    UserProfileItem(id: e.id, userName: e.userName, age: e.age, gender: e.gender, isPremium: e.isPremium)).toList();
  }



}