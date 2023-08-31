import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssedisdik/src/common_widgets/bullet_widget.dart';
import 'package:ssedisdik/src/common_widgets/custom_appbar_widget.dart';
import 'package:ssedisdik/src/common_widgets/number_inc_dec_widget.dart';
import 'package:ssedisdik/src/features/authentication/controllers/orientation_controller.dart';
import 'package:ssedisdik/src/features/authentication/controllers/pejabat_controller.dart';
import 'package:ssedisdik/src/features/authentication/controllers/type_controller.dart';
import 'package:ssedisdik/src/features/authentication/models/documents_categories_model.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/upload_documents/pejabat_tte_widget.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/upload_documents/orientation_widget.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/upload_documents/type_widget.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/upload_documents/unit_kerja_asal_widget.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/constants/text_strings.dart';
import 'package:ssedisdik/src/features/authentication/controllers/home/documents_categories_controller.dart';
import 'package:ssedisdik/src/features/authentication/controllers/unit_kerja_controller.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/upload_documents/document_categories_widget.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/upload_documents/unit_kerja_tujuan_widget.dart';
import 'package:ssedisdik/src/utils/api_service.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
//   void postData() async {
//   try {
//     final requestData = {
//       // Populate this map with the required parameters for your POST request
//       'nama_dokumen': 'Document Name',
//       'kategori_dokumen': 'Document Category',
//       'asal_dokumen' : '',
//       'ukuran_dokumen' : '',
//       'file' : '',
//       'kirim_ke' : '',
//       'pejabat_tte' : '',
//     };

//     final documentApiResponse = await ApiService().postDocumentData(
//       requestData: requestData,
//     );

//     // Now you can access the parsed data
//     print(documentApiResponse.results.documentName);
//     print(documentApiResponse.results.file[0].fileName);
//     print(documentApiResponse.results.esign[0].page);

//     // ... (do whatever you need with the data)
//   } catch (error) {
//     // Handle the error
//     print('Error posting document data: $error');
//   }
// }

  final DocCategoriesController docCategoriesController =
      Get.put<DocCategoriesController>(DocCategoriesController());
  DocCategoriesModel? selectedCategory;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      await docCategoriesController.fetchCategories();
      if (docCategoriesController.categories.isNotEmpty) {
        selectedCategory = docCategoriesController.categories[0];
      }
    } catch (error) {
      print('Error fetching categories: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;

    Get.put<UnitKerjaController>(UnitKerjaController());
    Get.put<PejabatController>(PejabatController());
    Get.put<OrientationController>(OrientationController());
    Get.put<TypeController>(TypeController());
    final unitKerjaController = Get.find<UnitKerjaController>();
    final pejabatController = Get.find<PejabatController>();
    final orientationController = Get.find<OrientationController>();
    final typeController = Get.find<TypeController>();

    return ColorfulSafeArea(
      color: primaryColor,
      overflowRules: const OverflowRules.only(top: false, bottom: true),
      child: Scaffold(
        body: SingleChildScrollView(
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
                  // -- Rules
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
                          padding: EdgeInsets.only(top: 8.0, left: 6.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(),
                                child: BulletParagraph(
                                  text: tBullet1,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: BulletParagraph(
                                  text: tBullet2,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: BulletParagraph(
                                  text: tBullet3,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: BulletParagraph(
                                  text: tBullet4,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: BulletParagraph(
                                  text: tBullet5,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: BulletParagraph(
                                  text: tBullet6,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: BulletParagraph(
                                  text: tBullet7,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // -- Ends of Rules

                  const SizedBox(
                    height: tHomePadding,
                  ),

                  // -- Upload Documents Title
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(tUploadTitle,
                          style: txtTheme.displayLarge?.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  // -- Ends of Upload Documents Title

                  const SizedBox(
                    height: 10.0,
                  ),

                  // -- Choose File
                  Container(
                    height: size.height * 0.04,
                    width: size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Color.fromARGB(237, 238, 238, 238),
                    ),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor2,
                            elevation: 0.0, // Remove button shadow
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0),
                            )),
                          ),
                          child: const Text('Pilih file',
                              style: TextStyle(color: Colors.black)),
                        ),
                        const SizedBox(
                            width:
                                8.0), // Add spacing between the button and container
                        const Text(
                          'Text inside the container',
                          style: TextStyle(color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  // -- Ends of Choose File

                  const SizedBox(
                    height: tHomePadding,
                  ),

                  // -- Documents Detail Title
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(tDetailTitle,
                          style: txtTheme.displayLarge?.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  // -- Ends of Documents Detail Title

                  const SizedBox(
                    height: 5.0,
                  ),

                  // -- Documents Detail - Perihal
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
                      fillColor: const Color.fromARGB(237, 238, 238, 238),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  // -- Ends of Documents Detail - Perihal

                  const SizedBox(
                    height: 10.0,
                  ),

                  // -- Documents Detail - Categories
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(tCategories,
                          style:
                              txtTheme.displayLarge?.copyWith(fontSize: 14))),

                  const SizedBox(
                    height: 5.0,
                  ),

                  CategoryDropdownButton(
                    selectedCategory: selectedCategory,
                    categories: docCategoriesController.categories,
                    onChanged: (category) {
                      setState(() {
                        selectedCategory = category;
                      });
                      // Call your other method here and pass selectedCategory as a parameter
                      // yourMethod(selectedCategory);
                    },
                  ),
                  // -- Ends of Documents Detail - Categories

                  const SizedBox(
                    height: 5.0,
                  ),

                  // -- Documents Detail - Asal Dokumen
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(tDocumentOrigin,
                          style:
                              txtTheme.displayLarge?.copyWith(fontSize: 14))),

                  const SizedBox(
                    height: 5.0,
                  ),

                  UnitKerjaAsalButton(units: unitKerjaController.unitsKerja),
                  // -- Ends of Documents Detail - Asal Dokumen

                  const SizedBox(
                    height: 10.0,
                  ),

                  // -- Documents Detail - Tujuan Dokumen
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(tDocumentDestination,
                          style:
                              txtTheme.displayLarge?.copyWith(fontSize: 14))),

                  const SizedBox(
                    height: 5.0,
                  ),

                  UnitKerjaTujuanButton(units: unitKerjaController.unitsKerja),
                  // -- Ends of Documents Detail - Tujuan Dokumen

                  const SizedBox(
                    height: 10.0,
                  ),

                  // -- Documents Detail -- Pejabat TTE
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(tDocumentSigner,
                          style:
                              txtTheme.displayLarge?.copyWith(fontSize: 14))),

                  const SizedBox(
                    height: 5.0,
                  ),
                  PejabatPenandatanganButton(
                      pejabats: pejabatController.pejabats),
                  // -- Ends of Documents Detail -- Pejabat TTE

                  const SizedBox(
                    height: 10.0,
                  ),

                  // -- Documents Detail -- TTE Details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // -- TTE Details
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // -- TTE Details -- Halaman
                          Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(tDocumentPageFiles,
                                      style: txtTheme.displayLarge
                                          ?.copyWith(fontSize: 14))),
                              const SizedBox(
                                height: 5.0,
                              ),
                              const NumberInputIncrementDecrement()
                            ],
                          ),
                          // -- Ends of TTE Details -- Halaman

                          const SizedBox(
                            width: 5.0,
                          ),

                          // -- TTE Details -- Posisi
                          Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(tDocumentPageOrientation,
                                      style: txtTheme.displayLarge
                                          ?.copyWith(fontSize: 14))),
                              const SizedBox(
                                height: 5.0,
                              ),
                              OrientationDropdownButton(
                                  orientations:
                                      orientationController.orientations)
                            ],
                          ),
                          // -- Ends of TTE Details -- Posisi

                          const SizedBox(
                            width: 5.0,
                          ),

                          // -- TTE Details -- Jenis
                          Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(tDocumentPageType,
                                      style: txtTheme.displayLarge
                                          ?.copyWith(fontSize: 14))),
                              const SizedBox(
                                height: 5.0,
                              ),
                              TypeDropdownButton(types: typeController.types)
                            ],
                          ),
                          // -- Ends of TTE Details -- Jenis

                          const SizedBox(
                            width: 5.0,
                          ),

                          // -- TTE Details -- Tanda Tag
                          Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(tDocumentPageTag,
                                      style: txtTheme.displayLarge
                                          ?.copyWith(fontSize: 14))),
                              const SizedBox(
                                height: 5.0,
                              ),
                              SizedBox(
                                width: size.width * 0.18,
                                height: size.height * 0.05,
                                child: TextField(
                                  style: txtTheme.displaySmall
                                      ?.copyWith(fontSize: 14),
                                  decoration: InputDecoration(
                                    filled: true,
                                    hintText: "Isi Tag",
                                    contentPadding:
                                        const EdgeInsets.only(left: 20.0),
                                    fillColor: const Color.fromARGB(
                                        237, 238, 238, 238),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          // -- Ends of TTE Details -- Tanda Tag
                        ],
                      ),
                      // -- Ends of TTE Details

                      // -- Button to Add TTE Details
                      SizedBox(
                        width: size.width * 0.15,
                        height: size.height * 0.05,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                buttonColor, // Remove button shadow
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          child: const Icon(Icons.add),
                        ),
                      ),
                      // -- Ends of Button to Add TTE Details
                    ],
                  ),
                  // -- Ends of Documents Detail -- Halaman

                  const SizedBox(
                    height: 50.0,
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
