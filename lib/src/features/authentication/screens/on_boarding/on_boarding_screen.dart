import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/features/authentication/controllers/on_boarding_controller.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final obController = OnBoardingController();

    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            pages: obController.pages,
            liquidController: obController.controller,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
            onPageChangeCallback: obController.onPageChangedCallback,
          ),
          Positioned(
              bottom: 80.0,
              left: 200,
              child: OutlinedButton(
                onPressed: () => obController.animateToNextSlide(),
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.black26),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    onPrimary: Colors.white),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                      color: primaryColor, shape: BoxShape.circle),
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              )),
          Positioned(
              top: 30,
              right: 20,
              child: TextButton(
                  onPressed: () => obController.skip(),
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Color.fromARGB(255, 233, 232, 232)),
                  ))),
          Obx(
            () => Positioned(
                bottom: 20,
                right: 225,
                child: AnimatedSmoothIndicator(
                  activeIndex: obController.currentPage.value,
                  effect: const WormEffect(
                      activeDotColor: primaryColor, dotHeight: 5.0),
                  count: 2,
                )),
          )
        ],
      ),
    );
  }
}
