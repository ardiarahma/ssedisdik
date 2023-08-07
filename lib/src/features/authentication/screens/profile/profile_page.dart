import 'package:flutter/material.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/constants/image_strings.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final txtTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            WaveWidget(
                config: CustomConfig(colors: [
                  Colors.white,
                  Colors.white54,
                  Colors.white30,
                  Colors.white24,
                ], durations: [
                  32000,
                  21000,
                  18000,
                  5000
                ], heightPercentages: [
                  0.06,
                  0.07,
                  0.09,
                  0.12
                ]),
                backgroundColor: primaryColor,
                size: Size(double.maxFinite, double.infinity)),
            Padding(
              padding: const EdgeInsets.only(left: tHomePadding, right: tHomePadding),
              child: Column(
                
                children: [
                  // -- User Name
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.all(tDefaultSize),
                      child: Text(
                        "namanya siapa",
                        style: txtTheme.displayLarge?.copyWith(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  // -- Ends of User Name
            
                  const SizedBox(height: 80),
            
                  Container(
                    height: size.height * 0.05,
                    width: size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Color.fromARGB(237, 238, 238, 238),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("ssssdvs"),
                        ElevatedButton.icon(onPressed: () {
                          // do something here
                        }, icon: Icon(Icons.arrow_right_rounded), label: Text(" "))
                      ],
                    ),
                  )
                  // LoginHeaderWidget(size: size),
                  // const LoginForm(),
                  // Positioned(
                  //     bottom: 0,
                  //     left: 0,
                  //     right: 0,
                  //     child: Container(child: const LoginFooterWidget()))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
