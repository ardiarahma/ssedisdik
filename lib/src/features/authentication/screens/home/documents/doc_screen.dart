import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssedisdik/main.dart';
import 'package:ssedisdik/src/features/authentication/controllers/home/documents_controller.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/documents/doc_header_widget.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/documents/doc_list_widget.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/documents/doc_tabs_widget.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({super.key});

  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  Future<void> _refreshData() async {
    logger.i('Refreshing data...');
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      // carouselData = List.generate(5, (index) => 'Item ${index + 1}');
      // _documentsController.fetchDocuments();
    });
    logger.i('Data refreshed');
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
          // controller: controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              DocumentHeaderWidget(
                  size: Size(double.infinity, size.height * 0.15)),
              // Ends of Header

              const SizedBox(height: 20),

              // Document Tab
              const DocumentsTabCategoriesWidget(),
              // Ends of Document Tab

              // Document List
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetBuilder<DocumentsController>(
                  builder: (controller) {
                    return SizedBox(
                      height: size.height,
                      child: ListView.builder(
                        controller: _scrollController,
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
                ),
              ),
              // Ends of Document List

              const SizedBox(
                height: 30.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
