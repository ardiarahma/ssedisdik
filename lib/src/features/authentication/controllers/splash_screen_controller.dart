import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssedisdik/src/common_widgets/hidden_drawer.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();
  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(Duration(milliseconds: 5000));
    Get.to(const MyDrawer());
    // Navigator.of(context).popUntil((route) => route.isFirst);
    // Navigator.pushReplacement(this.context,
    //     MaterialPageRoute(builder: (BuildContext context) => MyDrawer()));
  }
}
