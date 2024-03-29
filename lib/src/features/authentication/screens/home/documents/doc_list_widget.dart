import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/features/authentication/models/documents_model.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/documents/doc_details_screen.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/documents/doc_edit_screen.dart';

class DocumentsWidget extends StatefulWidget {
  const DocumentsWidget({super.key, required this.model});
  final DocumentsModel model;

  @override
  State<DocumentsWidget> createState() => _DocumentsWidgetState();
}

class _DocumentsWidgetState extends State<DocumentsWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Flexible(
      child: Container(
        // height: size.height * 0.2,
        width: size.width,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(0, 2))
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
              child: Text(
                widget.model.documentName,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 2.0, right: 10.0),
              child: Row(
                children: [
                  Text("Asal Dokumen : ",
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 14, color: Colors.white)),
                  Text(widget.model.documentFrom,
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 14, color: Colors.white)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Text("Tanggal : ",
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 14, color: Colors.white)),
                  Text(widget.model.documentCreatedAt,
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 14, color: Colors.white)),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
              child: Row(
                children: [
                  Text("Total TTE : ",
                      textAlign: TextAlign.left,
                      // model.originFrom,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 14, color: Colors.white)),
                  Text(widget.model.documentCountTte.toString(),
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 14, color: Colors.white)),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    width: 45,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero)),
                      child: const Icon(Icons.info_outline_rounded),
                      onPressed: () => Get.to(
                          () => DocItemDetailScreen(model: widget.model)),
                    ),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: 45,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero)),
                      child: const Icon(Icons.edit),
                      onPressed: () =>
                          Get.to(() => DocItemEditScreen(model: widget.model)),
                    ),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: 45,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero)),
                      child: Icon(Icons.delete_outline_rounded),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Konfirmasi'),
                                content: const Text(
                                    'Apakah Anda yakin ingin menghapus dokumen ini?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      // Add your "Yes" button logic here
                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Dokumen berhasil dihapus!'),
                                          duration: Duration(seconds: 3),
                                        ),
                                      );
                                    },
                                    child: const Text('Ya'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Tidak'),
                                  ),
                                ],
                              );
                            });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
