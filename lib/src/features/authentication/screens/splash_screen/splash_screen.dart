import 'dart:js';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssedisdik/src/common_widgets/hidden_drawer.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/constants/image_strings.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/constants/text_strings.dart';
import 'package:ssedisdik/src/features/authentication/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashScreenController.startAnimation();
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: splashScreenController.animate.value ? 0 : -30,
                right: splashScreenController.animate.value ? 0 : -30,
                child: Image(
                  image: AssetImage(tSplashTopIcon),
                )),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                bottom: splashScreenController.animate.value ? 0 : -30,
                left: splashScreenController.animate.value ? 0 : -30,
                child: Image(
                  image: AssetImage(tSplashBottomIcon),
                )),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: 50,
                left: splashScreenController.animate.value ? tDefaultSize : -80,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1600),
                  opacity: splashScreenController.animate.value ? 1 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppName,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        AppTagLine,
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  ),
                )),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: const Duration(milliseconds: 2400),
                top: 100,
                bottom: splashScreenController.animate.value ? 100 : 0,
                right: 100,
                left: 100,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: splashScreenController.animate.value ? 1 : 0,
                  child: Image(image: AssetImage(logoDisdik)),
                )),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: const Duration(milliseconds: 2400),
                bottom: 30,
                right: tDefaultSize,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: splashScreenController.animate.value ? 1 : 0,
                  child: Container(
                    width: tSplashContainerSize,
                    height: tSplashContainerSize,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: primaryColor),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
