import 'package:flutter/material.dart';

class BulletParagraph extends StatelessWidget {
  final String text;
  const BulletParagraph({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // CircleAvatar(
        //   radius: 4,
        //   backgroundColor: Colors.black,
        // ),
        // SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      '• ', // Bullet point character (you can change it to any other symbol or icon)
                  style: txtTheme.displayMedium
                      ?.copyWith(fontSize: 14),
                ),
                TextSpan(
                  text: text, // Use the 'text' parameter provided to the widget
                  style: txtTheme.displayMedium
                      ?.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
