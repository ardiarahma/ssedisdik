import 'package:flutter/material.dart';
import 'package:ssedisdik/src/constants/image_strings.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: tFormHeight - 10),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: const Image(
                        image: AssetImage(logoDisdik),
                        height: tLoginLogo,
                        width: tLoginLogo,
                      ),
                    ),
                    Container(
                      child: const Image(
                        image: AssetImage(logoDisdik),
                        height: tLoginLogo,
                        width: tLoginLogo,
                      ),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.login),
                      label: Text(tLogin),
                    )),
                // Image(
                //   image: AssetImage(iLogoBSrE),
                //   height: tLoginLogo,
                //   width: tLoginLogo,
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
