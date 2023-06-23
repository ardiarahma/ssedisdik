import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/constants/image_strings.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/constants/text_strings.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/home_card_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: tHomePadding, right: tHomePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(tGreeting, style: txtTheme.displayMedium),
                Text(
                  "namanya siapa",
                  style: txtTheme.displayMedium,
                )
              ],
            ),
            Text(
              tGreetingSub,
              style: txtTheme.displaySmall,
            ),
            const SizedBox(height: tHomePadding),

            // Banner 1 & 2
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PhysicalModel(
                    color: Colors.white,
                    elevation: 6.0,
                    shadowColor: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: const Border(
                              left:
                                  BorderSide(width: 5.0, color: Colors.blue))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "000",
                            style: txtTheme.displayMedium,
                          ),
                          const SizedBox(height: 25),
                          Text(tHomeBanner1, style: txtTheme.bodySmall)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: tHomePadding),
                Expanded(
                  child: PhysicalModel(
                    color: Colors.white,
                    elevation: 6.0,
                    shadowColor: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: const Border(
                              left: BorderSide(
                                  width: 5.0, color: Colors.yellow))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "000",
                            style: txtTheme.displayMedium,
                          ),
                          const SizedBox(height: 25),
                          Text(tHomeBanner2, style: txtTheme.bodySmall)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: tHomePadding),

            // Banner 3 & 4
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PhysicalModel(
                    color: Colors.white,
                    elevation: 6.0,
                    shadowColor: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: const Border(
                              left:
                                  BorderSide(width: 5.0, color: Colors.green))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "000",
                            style: txtTheme.displayMedium,
                          ),
                          const SizedBox(height: 25),
                          Text(tHomeBanner3, style: txtTheme.bodySmall)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: tHomePadding),
                Expanded(
                  child: PhysicalModel(
                    color: Colors.white,
                    elevation: 6.0,
                    shadowColor: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: const Border(
                              left: BorderSide(width: 5.0, color: Colors.red))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "000",
                            style: txtTheme.displayMedium,
                          ),
                          const SizedBox(height: 25),
                          Text(tHomeBanner4, style: txtTheme.bodySmall)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: tHomePadding),

            // Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   children: [
            //     Container(
            //       color: primaryColor,
            //       padding: const EdgeInsets.all(tHomePadding),
            //       child: Center(
            //           child: Text('Dinas Pendidikan Prov. DKI Jakarta © 2023',
            //               style: txtTheme.bodySmall)),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
