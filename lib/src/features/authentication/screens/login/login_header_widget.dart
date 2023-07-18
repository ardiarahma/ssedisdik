import 'package:flutter/material.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/constants/image_strings.dart';
import 'package:ssedisdik/src/constants/text_strings.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            WaveWidget(
                config: CustomConfig(colors: [
                  Colors.white70,
                  Colors.white54,
                  Colors.white30,
                  Colors.white24,
                ], durations: [
                  32000,
                  21000,
                  18000,
                  5000
                ], heightPercentages: [
                  0.25,
                  0.26,
                  0.28,
                  0.31
                ]),
                backgroundColor: primaryColor,
                size: size),
            Container(
              child: Image(
                image: AssetImage(logoSse),
                height: size.height * 0.2,
              ),
            ),
          ],
        ),
        Text(
          tLoginTitle,
          style: Theme.of(context).textTheme.displayMedium,
          textAlign: TextAlign.center,
        ),
        Text(tLoginSubtitle,
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center),
      ],
    );
  }
}
