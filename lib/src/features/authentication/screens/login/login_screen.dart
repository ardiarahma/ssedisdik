import 'package:flutter/material.dart';
import 'package:ssedisdik/src/constants/image_strings.dart';
import 'package:ssedisdik/src/constants/sizes.dart';

import '../../../../constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(children: [
              /* -- Section 1 --*/
              Image(
                image: AssetImage(iWelcomeScreenImage),
                height: size.height * 0.2,
              ),
              Text(
                tLoginTitle,
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              Text(tLoginSubtitle,
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center)
                  /* -- End Section 1 -- */

                  /* -- Section 2 -- */
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person_outline_outlined),
                            labelText: tEmailInput,
                            hintText: tEmailInput,
                                      
                          ))
                        ],
                      ),
                    ),
                  )

            ]),
          ),
        ),
      ),
    );
  }
}
