// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/constants/image_strings.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/constants/text_strings.dart';
import 'package:ssedisdik/src/features/authentication/controllers/home/documents_controller.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/documents/doc_list_widget.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/home_carousel_widget.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/home_header_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                const SizedBox(height: tHomePadding),
                // -- End of Slider

                // -- Documents List Start
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(tDaftarDokumen,
                        style: txtTheme.displayLarge?.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold))),

                // -- Search

                const SizedBox(height: tHomePadding),

                // -- Title Documents
                TextField(
                  style: txtTheme.displaySmall?.copyWith(fontSize: 16),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none),
                      hintText: tSearchDoc,
                      suffixIcon: const Icon(Icons.search_rounded),
                      suffixIconColor: primaryColor),
                ),
                // -- End of Documents Title

                const SizedBox(height: tHomePadding),

                // -- ListView Documents
                GetBuilder<DocumentsController>(
                  builder: (controller) {
                    return SizedBox(
                      height: 300,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.documentsList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: DocumentsWidget(
                              model: controller.documentsList[index],
                            ),
                          );
                        },
                      ),
                    );
                  },
                )
                // -- End of ListView
              ],
            ),
          )
        ]),
      ),
    );
  }
}
