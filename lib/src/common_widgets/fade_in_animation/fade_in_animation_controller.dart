// ignore_for_file: unused_import

import 'package:get/get.dart';
import 'package:ssedisdik/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:ssedisdik/src/features/authentication/screens/login/login_screen.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();
  RxBool animate = false.obs;

  Future startSplashAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 3000));
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 5000));
    Get.offAll(() => const LoginScreen(),
        duration: const Duration(milliseconds: 1000),
        transition: Transition.fadeIn);
  }

// -- dipanggil kalo mau pake animate In di widget manapun
  Future animationIn() async {
    await Future.delayed(const Duration(milliseconds: 100));
    animate.value = true;
  }

// -- dipanggil kalo mau pake animate Out di widget manapun
  Future animationOut() async {
    await Future.delayed(const Duration(milliseconds: 100));
    animate.value = false;
  }
}
