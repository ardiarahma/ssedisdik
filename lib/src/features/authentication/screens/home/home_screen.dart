import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/constants/text_strings.dart';
import 'package:ssedisdik/src/features/authentication/controllers/home/documents_controller.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/documents/doc_list_widget.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/documents/doc_tabs_widget.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/home_carousel_widget.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/home_header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DocumentsController _documentsController =
      Get.find<DocumentsController>();
  List<String> carouselData = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    print('Initial currentPage: ${_documentsController.currentPage}');
    _documentsController.fetchDocuments();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Load more when scrolling reaches the end
      _documentsController.fetchDocuments();
    }
  }

  Future<void> _refreshData() async {
    print('Refreshing data...');
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      carouselData = List.generate(5, (index) => 'Item ${index + 1}');
      _documentsController.fetchDocuments();
    });
    print('Data refreshed');
  }

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // -- Header Start
            HomeHeaderWidget(size: Size(double.infinity, size.height * 0.15)),
            // -- End of Header

            const SizedBox(height: tHomePadding),

            // -- Contain Start
            Container(
              padding: const EdgeInsets.only(
                  left: tHomePadding, right: tHomePadding),
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
                              padding:
                                  const EdgeInsets.only(left: 7.0, top: 2.0),
                              child: Text(tInfoSse,
                                  style: txtTheme.displayLarge?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
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
                  HomeCarouselWidget(
                      carouselData: carouselData,
                      refreshCallback: _refreshData),
                  const SizedBox(height: tHomePadding),
                  // -- End of Slider

                  // -- Title Documents
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(tDaftarDokumen,
                          style: txtTheme.displayLarge?.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  // -- End of Documents Title

                  const SizedBox(height: tHomePadding),

                  // -- Search
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
                        onChanged: (newTerm) {
                          _documentsController.updateSearchTerm(newTerm);
                        },
                  ),
                  
                  // -- Ends of Search

                  const SizedBox(height: tHomePadding),

                  // -- Tabs Categories
                  const DocumentsTabCategoriesWidget(),
                  // -- Ends of Tabs Categories

                  const SizedBox(height: 10.0),

                  // -- ListView Documents
                  GetBuilder<DocumentsController>(
                    builder: (controller) {
                      return SizedBox(
                        height: size.height,
                        child: ListView.builder(
                          controller: _scrollController,
                          shrinkWrap: true,
                          itemCount: controller.documentsList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: DocumentsWidget(
                                model: controller.documentsList[index],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  // -- End of ListView

                  const SizedBox(
                    height: 30.0,
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
