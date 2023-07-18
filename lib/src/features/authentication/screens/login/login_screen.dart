import 'package:flutter/material.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:ssedisdik/src/features/authentication/screens/login/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(children: [
              LoginHeaderWidget(size: size),
              const LoginForm(),
            ]),
          ),
        ),
      ),
    );
  }
}
