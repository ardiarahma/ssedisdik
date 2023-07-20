// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/constants/image_strings.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/constants/text_strings.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/home_carousel_widget.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/home_header_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: [
        // -- Header Start
        HomeHeaderWidget(
          size: Size(double.infinity, size.height * 0.15),
        ),
        // -- End of Header

        const SizedBox(height: tHomePadding),

        // -- Contain Start
        Container(
          padding:
              const EdgeInsets.only(left: tHomePadding, right: tHomePadding),
          child: Column(
            children: [
              // Info Start
              Container(
                padding: const EdgeInsets.all(7.0),
                height: 80,
                decoration: BoxDecoration(
                    border: Border.all(color: blue_pallete_1),
                    borderRadius: BorderRadius.circular(15.0),
                    color: powderBlue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.info_outline_rounded,
                          color: Colors.red,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7.0, top: 2.0),
                          child: Text(tInfoSse,
                              style: txtTheme.displayLarge?.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 10.0),
                      child: Text("Sementara ini tidak ada informasi."),
                    )
                  ],
                ),
              ),
              // -- End of Info

              // -- Carousel Slider Start
              const HomeCarouselWidget(),
              const SizedBox(height: 10),
              // -- End of Slider

              // -- Documents List Start
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(tDaftarDokumen,
                      style: txtTheme.displayLarge?.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              const SizedBox(height: tHomePadding),

              // -- End of Documents List
            ],
          ),
        )
      ]

          // -- Banner 1 & 2
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Expanded(
          //       child: PhysicalModel(
          //         color: Colors.white,
          //         elevation: 6.0,
          //         shadowColor: Colors.grey,
          //         borderRadius: BorderRadius.circular(10.0),
          //         child: Container(
          //           decoration: BoxDecoration(
          //               border: const Border(
          //                   left:
          //                       BorderSide(width: 5.0, color: Colors.blue))),
          //           padding: const EdgeInsets.symmetric(
          //               horizontal: 10, vertical: 20),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 "000",
          //                 style: txtTheme.displayMedium,
          //               ),
          //               const SizedBox(height: 25),
          //               Text(tHomeBanner1, style: txtTheme.bodySmall)
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //     const SizedBox(width: tHomePadding),
          //     Expanded(
          //       child: PhysicalModel(
          //         color: Colors.white,
          //         elevation: 6.0,
          //         shadowColor: Colors.grey,
          //         borderRadius: BorderRadius.circular(10.0),
          //         child: Container(
          //           decoration: BoxDecoration(
          //               border: const Border(
          //                   left: BorderSide(
          //                       width: 5.0, color: Colors.yellow))),
          //           padding: const EdgeInsets.symmetric(
          //               horizontal: 10, vertical: 20),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 "000",
          //                 style: txtTheme.displayMedium,
          //               ),
          //               const SizedBox(height: 25),
          //               Text(tHomeBanner2, style: txtTheme.bodySmall)
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: tHomePadding),

          // -- Banner 3 & 4
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Expanded(
          //       child: PhysicalModel(
          //         color: Colors.white,
          //         elevation: 6.0,
          //         shadowColor: Colors.grey,
          //         borderRadius: BorderRadius.circular(10.0),
          //         child: Container(
          //           decoration: BoxDecoration(
          //               border: const Border(
          //                   left:
          //                       BorderSide(width: 5.0, color: Colors.green))),
          //           padding: const EdgeInsets.symmetric(
          //               horizontal: 10, vertical: 20),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 "000",
          //                 style: txtTheme.displayMedium,
          //               ),
          //               const SizedBox(height: 25),
          //               Text(tHomeBanner3, style: txtTheme.bodySmall)
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //     const SizedBox(width: tHomePadding),
          //     Expanded(
          //       child: PhysicalModel(
          //         color: Colors.white,
          //         elevation: 6.0,
          //         shadowColor: Colors.grey,
          //         borderRadius: BorderRadius.circular(10.0),
          //         child: Container(
          //           decoration: BoxDecoration(
          //               border: const Border(
          //                   left: BorderSide(width: 5.0, color: Colors.red))),
          //           padding: const EdgeInsets.symmetric(
          //               horizontal: 10, vertical: 20),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 "000",
          //                 style: txtTheme.displayMedium,
          //               ),
          //               const SizedBox(height: 25),
          //               Text(tHomeBanner4, style: txtTheme.bodySmall)
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: tHomePadding + 20.0),

          // Text(tDaftarDokumen, style: txtTheme.displayMedium),
          // const SizedBox(height: tHomePadding),

          // -- Search
          // TextField(
          //   style: txtTheme.displaySmall?.apply(color: primaryColor),
          //   decoration: InputDecoration(
          //       filled: true,
          //       fillColor: Colors.grey.shade300,
          //       border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(10.0),
          //           borderSide: BorderSide.none),
          //       hintText: "Cari Dokumen",
          //       suffixIcon: Icon(Icons.search_rounded),
          //       suffixIconColor: primaryColor),
          // )
          // PhysicalModel(
          //   color: Colors.grey.shade100,
          //   borderRadius: BorderRadius.circular(10.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       border: Border(left: BorderSide(width: 5)),
          //     ),
          //     padding:
          //         const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text("Cari Dokumen",
          //             style: txtTheme.displaySmall
          //                 ?.apply(color: Colors.grey.withOpacity(0.50))),
          //         const Icon(Icons.search, size: 20)
          //       ],
          //     ),
          //   ),
          // ),

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
          // ],
          ),
    );
  }
}
