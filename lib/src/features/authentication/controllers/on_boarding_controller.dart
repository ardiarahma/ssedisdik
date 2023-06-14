import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:ssedisdik/src/common_widgets/hidden_drawer.dart';

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
            image: iOnBoardingImage1,
            title: tOnBoardingTitle1,
            subTitle: tOnBoardingSubtitle1,
            counterText: tOnBoardingCounter1,
            bgColor: cOnBoardingPage1Color)),
    OnBoardingPageWidget(
        model: OnBoardingModel(
            image: iOnBoardingImage2,
            title: tOnBoardingTitle2,
            subTitle: tOnBoardingSubtitle2,
            counterText: tOnBoardingCounter2,
            bgColor: cOnBoardingPage2Color))
  ];

  onPageChangedCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;
  skip() => Get.to(const MyDrawer());
  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
}
