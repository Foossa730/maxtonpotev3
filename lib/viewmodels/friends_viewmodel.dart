// lib/viewmodels/friends_viewmodel.dart
import 'package:flutter/material.dart';
import '../models/my_friend.dart';

class FriendsViewModel extends ChangeNotifier {
  final List<MyFriend> _favoriteFriends = [];
  List<MyFriend> get favoriteFriends => _favoriteFriends;

  void toggleFavorite(MyFriend friend) {
    if (_favoriteFriends.contains(friend)) {
      _favoriteFriends.remove(friend);
    } else {
      _favoriteFriends.add(friend);
    }
    notifyListeners();
  }
}
