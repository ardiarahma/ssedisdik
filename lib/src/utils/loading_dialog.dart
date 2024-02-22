import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingDialog {
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'assets/loading_animation_1.json', // replace with your Lottie animation file
                height: 70,
                width: 70,
                repeat: true,
                reverse: false,
                animate: true,
              ),
              const SizedBox(height: 16),
              const Text("Memuat.."), // Add 'const' keyword here
            ],
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}
