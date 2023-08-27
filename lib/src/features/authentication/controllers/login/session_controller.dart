import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:ssedisdik/src/features/authentication/screens/login/login_screen.dart';

class SessionManager extends ChangeNotifier {
  Timer? _sessionTimeoutTimer;
  static const int sessionTimeoutMinutes = 60;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  SessionManager() {
    _startSessionTimeoutTimer();
  }

  void _startSessionTimeoutTimer() {
    _sessionTimeoutTimer = Timer(const Duration(minutes: sessionTimeoutMinutes), () {
      _handleSessionTimeout();
    });
  }

  void _handleSessionTimeout() {
    // Triggered when the session times out
    logout();
    notifyListeners(); // Notify listeners about session timeout
  }

  void logout() {
    _secureStorage.deleteAll();
    const snackBar = SnackBar(
      content: Text('Sesi Anda telah berakhir. Silakan lakukan login kembali.'),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    Get.off(const LoginScreen());
  }

  void resetSessionTimeoutTimer() {
    _sessionTimeoutTimer?.cancel();
    _startSessionTimeoutTimer();
  }
}
