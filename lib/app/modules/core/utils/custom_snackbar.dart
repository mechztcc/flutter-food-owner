import 'package:flutter/material.dart';

class CustomSnackbar {
  final String message;
  final BuildContext context;

  CustomSnackbar({
    required this.message,
    required this.context,
  });

  success() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: const Color.fromARGB(255, 22, 194, 45),
      ),
    );
  }

  warning() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: const Color.fromARGB(255, 255, 122, 88),
      ),
    );
  }
}
