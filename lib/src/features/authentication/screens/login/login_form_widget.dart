import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ssedisdik/src/common_widgets/hidden_drawer.dart';
import 'package:ssedisdik/src/constants/image_strings.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/constants/text_strings.dart';

import '../../../../constants/colors.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: tFormHeight - 10, horizontal: tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    labelText: tEmailInput,
                    hintText: tEmailInput,
                    border: OutlineInputBorder())),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    labelText: tPasswordInput,
                    hintText: tPasswordInput,
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: null,
                        icon: Icon(Icons.remove_red_eye_sharp)))),
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
                        onPressed: () => Get.to(() => MyDrawer()),
                        icon: Icon(Icons.login),
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
                              color: primaryColor,
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
                      Container(
                        child: const Image(
                          image: AssetImage(logoBssn),
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 7, right: 7),
                        child: const Image(
                          image: AssetImage(logoBsre),
                          height: 70,
                          width: 110,
                        ),
                      ),
                      Container(
                        child: const Image(
                          image: AssetImage(logoDisdik),
                          height: 45,
                          width: 45,
                        ),
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
