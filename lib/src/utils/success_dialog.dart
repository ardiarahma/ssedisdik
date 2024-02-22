import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessDialog {
  static void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'assets/success_animation.json', // replace with your Lottie animation file
                height: 70,
                width: 70,
                repeat: true,
                reverse: false,
                animate: true,
              ),
              const SizedBox(height: 16),
              const Text(
                  "Dokumen berhasil disimpan!"), // Add 'const' keyword here
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'), // Add 'const' keyword here
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}
