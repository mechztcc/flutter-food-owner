import 'dart:ui';

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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Theme.of(context).primaryColor,
        action: SnackBarAction(
          label: 'Fechar',
          onPressed: () {},
          textColor: Colors.white,
        ),
      ),
    );
  }

  warning() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.orange,
        action: SnackBarAction(
          label: 'Fechar',
          onPressed: () {},
          textColor: Colors.white,
        ),
        // animation: ,
      ),
    );
  }
}
