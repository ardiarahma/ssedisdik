import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ssedisdik/main.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/constants/image_strings.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/constants/text_strings.dart';
import 'package:ssedisdik/src/features/authentication/controllers/home/documents_controller.dart';

class DocumentHeaderWidget extends StatefulWidget {
  const DocumentHeaderWidget({super.key, required this.size});

  final Size size;

  @override
  State<DocumentHeaderWidget> createState() => _DocumentHeaderWidgetState();
}

class _DocumentHeaderWidgetState extends State<DocumentHeaderWidget> {
  final DocumentsController _documentsController =
      Get.find<DocumentsController>();
  List<String> carouselData = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    logger.d('Initial currentPage: ${_documentsController.currentPage}');
    _documentsController.fetchDocuments();
    // _scrollController.addListener(_scrollListener);
    setState(() {
      _documentsController.fetchDocuments();
    });
  }

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(25),
      // height: size.height * 0.15,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0)),
        color: primaryColor,
      ),
      child: TextField(
        style: txtTheme.displaySmall?.copyWith(fontSize: 16),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none),
            hintText: tSearchDoc,
            hintStyle: txtTheme.displaySmall
                ?.copyWith(fontSize: 16, color: Colors.grey),
            suffixIcon: const Icon(Icons.search_rounded),
            suffixIconColor: primaryColor),
        onChanged: (newTerm) {
          _documentsController.updateSearchTerm(newTerm);
        },
      ),
    );
  }
}
