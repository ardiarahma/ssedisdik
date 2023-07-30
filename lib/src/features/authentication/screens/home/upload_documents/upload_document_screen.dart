import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssedisdik/src/common_widgets/custom_appbar_widget.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/constants/text_strings.dart';
import 'package:ssedisdik/src/features/authentication/controllers/home/documents_categories_controller.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/upload_documents/document_categories_widget.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;

    Get.put<DocCategoriesController>(DocCategoriesController());
    final docCategoriesController = Get.find<DocCategoriesController>();

    return Scaffold(
      body: ColorfulSafeArea(
        color: primaryColor,
        overflowRules: const OverflowRules.only(top: false, bottom: true),
        // bottom: true,
        child: SingleChildScrollView(
            child: Column(
          children: [
            // -- App Bar
            Stack(
              children: [
                CustomAppbar(
                  onBackPressed: () {
                    // Add any additional functionality you want here
                    Navigator.pop(context);
                  },
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      tUploadTitle,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            // -- End of AppBar

            // -- Content Start
            Container(
              padding: const EdgeInsets.only(
                  left: tHomePadding, right: tHomePadding, top: tHomePadding),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(tDetailTitle,
                          style: txtTheme.displayLarge?.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  const SizedBox(
                    height: 5.0,
                  ),

                  // Documents Title
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(tPerihal,
                          style:
                              txtTheme.displayLarge?.copyWith(fontSize: 14))),

                  const SizedBox(
                    height: 5.0,
                  ),

                  TextField(
                    keyboardType: TextInputType.multiline,
                    style: txtTheme.displaySmall?.copyWith(fontSize: 14),
                    maxLines:
                        1, // Set maxLines ke null agar tidak terbatas ke bawah
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "e-000/XX.0000 / XXXX / 00000",
                      fillColor: Colors.grey.shade300,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  // Ends of Documents Title

                  const SizedBox(
                    height: 10.0,
                  ),

                  // -- Documents Categories
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(tCategories,
                              style: txtTheme.displayLarge
                                  ?.copyWith(fontSize: 14))),
                      CategoryDropdownButton(
                          categories: docCategoriesController.categories)
                    ],
                  ),
                  // -- Ends of Documents Categories
                  const SizedBox(
                    height: 5.0,
                  ),

                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(tUploadTitle,
                          style: txtTheme.displayLarge?.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold))),

                  const SizedBox(
                    height: 5.0,
                  ),

                  Container(
                    padding: const EdgeInsets.all(7.0),
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
                              padding:
                                  const EdgeInsets.only(left: 7.0, top: 2.0),
                              child: Text(tDocumentRules,
                                  style: txtTheme.displayLarge?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 10.0),
                          // child: Text("Dokumen harus berformat PDF. n/ Lokasi TTE pada dokumen telah ditandai dengan hastag(#) n/ Jika ada dua TTE dalam satu halaman, maka dibedakan dengan jumlah hastag(#). Contoh: # dan ##.",),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
