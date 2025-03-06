import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onPressed;

  const MyButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent, // background color
      ),
      onPressed: onPressed,
      child: Container(
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}