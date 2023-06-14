import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../models/on_boarding_model.dart';
import '../screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
        model: OnBoardingModel(
            image: onBoardingImage1,
            title: onBoardingTitle1,
            subTitle: onBoardingSubtitle1,
            counterText: onBoardingCounter1,
            bgColor: onBoardingPage1Color)),
    OnBoardingPageWidget(
        model: OnBoardingModel(
            image: onBoardingImage2,
            title: onBoardingTitle2,
            subTitle: onBoardingSubtitle2,
            counterText: onBoardingCounter2,
            bgColor: onBoardingPage2Color))
  ];

  onPageChangedCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;
  skip() => controller.jumpToPage(page: 2);
  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
}
