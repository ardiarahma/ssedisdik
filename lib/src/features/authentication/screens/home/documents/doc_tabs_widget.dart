import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssedisdik/main.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/features/authentication/controllers/home/documents_controller.dart';

class DocumentsTabCategoriesWidget extends StatefulWidget {
  const DocumentsTabCategoriesWidget({Key? key}) : super(key: key);

  @override
  State<DocumentsTabCategoriesWidget> createState() =>
      _DocumentsTabCategoriesWidgetState();
}

class _DocumentsTabCategoriesWidgetState
    extends State<DocumentsTabCategoriesWidget> {
  int _selectedIndex = 0;
  final List<String> _tabTitles = [
    'Draft Dokumen',
    'Dokumen Terkirim',
    'Selesai TTE',
    'Dokumen Ditolak'
  ];
  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _tabTitles.asMap().entries.map((entry) {
          final index = entry.key;
          final title = entry.value;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });

              String? status;

              switch (index) {
                case 0:
                  status = "4"; // Draft Dokumen
                  setState(() {});
                  break;
                case 1:
                  status = "1"; // Dokumen Terkirim
                  setState(() {});
                  break;
                case 2:
                  status = "2"; // Selesai TTE
                  setState(() {});
                  break;
                case 3:
                  status = "3"; // Dokumen Ditolak
                  setState(() {});
                  break;
              }

              final documentsController = Get.find<DocumentsController>();
              documentsController.updateFilterStatus(status);
              setState(() {}); // Update the filterStatus
              logger.i('Status has changed.');
              documentsController.resetPageAndFetchDocuments();
              setState(() {}); 
              logger.i('Documents has reset.');// Fetch documents with the new filterStatus
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                height: size.height * 0.05,
                decoration: BoxDecoration(
                  border: Border.all(color: blue_pallete_1),
                  borderRadius: BorderRadius.circular(15.0),
                  color:
                      _selectedIndex == index ? powderBlue : Colors.transparent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    title,
                    style: txtTheme.displayLarge?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color:
                          _selectedIndex == index ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
