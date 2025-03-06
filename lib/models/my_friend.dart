// lib/models/my_friend.dart
import 'package:flutter/material.dart';

class MyFriend {
  final String firstName, lastName, description, imageUrl;
  final Color statusColor;

  MyFriend({
    required this.firstName,
    required this.lastName,
    required this.description,
    required this.imageUrl,
    required this.statusColor,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MyFriend &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode ^ imageUrl.hashCode;
}
