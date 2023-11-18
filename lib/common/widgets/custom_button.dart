// ignore_for_file: deprecated_member_use

import 'package:chat_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onPressed});
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: ColorPalette.tabColor,
        // minimumSize: const Size(double.infinity, 1),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
