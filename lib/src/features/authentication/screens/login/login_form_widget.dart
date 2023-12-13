import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ssedisdik/main.dart';
import 'package:ssedisdik/src/common_widgets/hidden_drawer.dart';
import 'package:ssedisdik/src/constants/image_strings.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/constants/text_strings.dart';
import 'package:ssedisdik/src/utils/api_service.dart';

import '../../../../constants/colors.dart';
import '../../controllers/login/session_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final ApiService apiService = ApiService();
  late SessionManager _sessionManager;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  bool _obscurePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sessionManager = Provider.of<SessionManager>(context, listen: false);
  }

  Future<void> _login(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;
    try {
      final loginResponse = await apiService.login(email, password);
      final accessToken = loginResponse.accessToken;

      // Store accessToken securely
      apiService.setAuthToken(accessToken);

      // Reset session timeout timer when the user logs in
      _sessionManager.resetSessionTimeoutTimer();

      Get.off(const MyDrawer());
      logger.i('login successful');
    } catch (error) {
      // Handle login or API errors
      logger.i('login unsuccessful');
      throw Exception('Login error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: tFormHeight - 10, horizontal: tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    labelText: tEmailInput,
                    hintText: tEmailInput,
                    border: OutlineInputBorder())),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                  filled: true,
                  prefixIcon: const Icon(Icons.password),
                  labelText: tPasswordInput,
                  hintText: tPasswordInput,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: _togglePasswordVisibility,
                    icon: Icon(_obscurePassword
                        ? Icons.visibility_off
                        : Icons.remove_red_eye_sharp),
                  )),
            ),
            const SizedBox(height: tFormHeight - 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // -- Login Button Options
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 270,
                      height: 45,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        onPressed: () {
                          _login(context);
                        },
                        icon: const Icon(Icons.login),
                        label: Text(
                          tLogin,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),

                    // -- Fingerprint Button
                    Expanded(
                        child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: buttonColor,
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2,
                                    offset: Offset(0, 2))
                              ],
                            ),
                            child: TextButton(
                                onPressed: () => Get.to(() => const MyDrawer()),
                                child: const Icon(
                                  Icons.fingerprint_rounded,
                                  color: Colors.white,
                                  size: 30,
                                )))),
                    // -- End of Fingerprint Button
                  ],
                ),

                // -- End of Login Options Button
                const SizedBox(height: 15),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage(logoBssn),
                        height: 50,
                        width: 50,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 7, right: 7),
                        child: const Image(
                          image: AssetImage(logoBsre),
                          height: 70,
                          width: 110,
                        ),
                      ),
                      const Image(
                        image: AssetImage(logoDisdik),
                        height: 45,
                        width: 45,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
