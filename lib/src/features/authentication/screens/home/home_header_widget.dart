import 'package:flutter/material.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/constants/image_strings.dart';
import 'package:ssedisdik/src/constants/text_strings.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Container(
      // height: size.height * 0.15,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        color: primaryColor,
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15),
                child: Image(
                    image: const AssetImage(logoSseOnly),
                    height: size.height * 0.5),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(tGreeting,
                            style: txtTheme.displayMedium
                                ?.copyWith(color: Colors.white, fontSize: 20)),
                        Text(
                          "namanya siapa",
                          style: txtTheme.displayMedium
                              ?.copyWith(color: Colors.white, fontSize: 20),
                        )
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      tGreetingSub,
                      style: txtTheme.displaySmall?.copyWith(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}