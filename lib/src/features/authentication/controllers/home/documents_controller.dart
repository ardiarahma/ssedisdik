import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssedisdik/src/constants/text_strings.dart';
import 'package:ssedisdik/src/features/authentication/models/documents_model.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/documents/doc_list_widget.dart';

class DocumentsController extends GetxController {
  final _documentsList = [
    DocumentsModel(
        documentsName: tDocName2,
        originFrom: tOrigin2,
        date: tDate2,
        totalTte: tTotal2),
    DocumentsModel(
        documentsName: tDocName1,
        originFrom: tOrigin1,
        date: tDate1,
        totalTte: tTotal1),
    DocumentsModel(
        documentsName: tDocName3,
        originFrom: tOrigin3,
        date: tDate3,
        totalTte: tTotal3),
  ];

  // List<Widget> documentsList() {
  //   return _documentsList
  //       .map((document) => DocumentsWidget(model: document))
  //       .toList();
  // }
  List<DocumentsModel> get documentsList => _documentsList;
}
