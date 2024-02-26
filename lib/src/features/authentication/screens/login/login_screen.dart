import 'package:flutter/material.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:ssedisdik/src/features/authentication/screens/login/login_header_widget.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import 'login_footer_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            WaveWidget(
                config: CustomConfig(colors: [
                  Colors.white,
                  Colors.white54,
                  Colors.white30,
                  Colors.white24,
                ], durations: [
                  32000,
                  21000,
                  18000,
                  5000
                ], heightPercentages: [
                  0.18,
                  0.19,
                  0.21,
                  0.24
                ]),
                backgroundColor: primaryColor,
                size: const Size(double.maxFinite, double.infinity)),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(tDefaultSize),
                  child: Image(
                    image: const AssetImage(logoSse),
                    height: size.height * 0.2,
                  ),
                ),
                const SizedBox(height: 35),
                LoginHeaderWidget(size: size),
                const LoginForm(),
              ],
            ),
            const Positioned(
                bottom: 10.0, left: 0.0, right: 0.0, child: LoginFooterWidget())
          ],
        ),
      ),
    );
  }
}
