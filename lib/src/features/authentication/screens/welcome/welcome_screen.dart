// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ssedisdik/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:ssedisdik/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:ssedisdik/src/constants/image_strings.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/constants/text_strings.dart';
import 'package:ssedisdik/src/features/authentication/screens/login/login_screen.dart';

import '../../../../common_widgets/fade_in_animation/fade_in_animation_controller.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.animationIn();
    var mediaQuary = MediaQuery.of(context);
    var height = mediaQuary.size.height;
    var brightness = mediaQuary.platformBrightness;

    return Scaffold(
      body: Stack(children: [
        TFadeInAnimation(
          durationInMs: 1200,
          animatePosition: TAnimatePosition(
              topAfter: 0,
              topBefore: 0,
              bottomAfter: 0,
              bottomBefore: -100,
              leftAfter: 0,
              leftBefore: 0,
              rightAfter: 0,
              rightBefore: 0),
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Image(image: AssetImage(iWelcomeScreenImage)),
                ),
                Text(
                  tWelcomeTitle,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  tWelcomeSubtitle,
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => LoginScreen()),
                        child: Text("Masuk"),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7))),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text("Registrasi"),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
