// lib/widgets/custom_app_bar.dart
import 'package:flutter/material.dart';
import '../constants.dart';

PreferredSizeWidget customAppBar(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    backgroundColor: primaryColor,
  );
}
