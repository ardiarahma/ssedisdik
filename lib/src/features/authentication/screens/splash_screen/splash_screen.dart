import 'dart:js';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssedisdik/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:ssedisdik/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:ssedisdik/src/common_widgets/hidden_drawer.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/constants/image_strings.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/constants/text_strings.dart';
import 'package:ssedisdik/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();
    return Scaffold(
      body: Stack(
        children: [
          TFadeInAnimation(
              durationInMs: 1600,
              animatePosition: TAnimatePosition(
                  topAfter: 0, topBefore: -30, rightAfter: 0, rightBefore: -30),
              child: const Image(image: AssetImage(iSplashTopIcon))),
          TFadeInAnimation(
              durationInMs: 1600,
              animatePosition: TAnimatePosition(
                  leftAfter: 0,
                  leftBefore: -30,
                  bottomAfter: 0,
                  bottomBefore: -30),
              child: const Image(image: AssetImage(iSplashBottomIcon))),
          TFadeInAnimation(
            durationInMs: 1600,
            animatePosition: TAnimatePosition(
                topAfter: 50,
                topBefore: 50,
                leftAfter: tDefaultSize,
                leftBefore: -80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppName,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  AppTagLine,
                  style: Theme.of(context).textTheme.displaySmall,
                )
              ],
            ),
          ),
          TFadeInAnimation(
              durationInMs: 2400,
              animatePosition: TAnimatePosition(
                  topAfter: 100,
                  topBefore: 100,
                  bottomAfter: 100,
                  bottomBefore: 0,
                  rightAfter: 100,
                  rightBefore: 100,
                  leftAfter: 100,
                  leftBefore: 100),
              child: Image(image: AssetImage(logoSse))),
          TFadeInAnimation(
            durationInMs: 2400,
            animatePosition: TAnimatePosition(
                bottomAfter: 30,
                bottomBefore: 30,
                rightAfter: tDefaultSize,
                rightBefore: tDefaultSize),
            child: Container(
              width: tSplashContainerSize,
              height: tSplashContainerSize,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: primaryColor),
            ),
          )
        ],
      ),
    );
  }
}
