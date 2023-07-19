import 'package:flutter/material.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:ssedisdik/src/features/authentication/screens/login/login_header_widget.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

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
                  0.15,
                  0.16,
                  0.18,
                  0.21
                ]),
                backgroundColor: primaryColor,
                size: Size(double.maxFinite, double.infinity)),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(tDefaultSize),
                  child: Image(
                    image: AssetImage(logoSse),
                    height: size.height * 0.2,
                  ),
                ),
                SizedBox(height: 35),
                Container(child: LoginHeaderWidget(size: size)),
                const LoginForm()
              ],
            )
          ],
        ),
      ),
    );
  }
}
