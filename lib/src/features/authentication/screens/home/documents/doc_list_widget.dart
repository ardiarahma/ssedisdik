import 'package:flutter/material.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/features/authentication/models/documents_model.dart';

class DocumentsWidget extends StatelessWidget {
  const DocumentsWidget({super.key, required this.model});
  final DocumentsModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.12,
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
            padding: const EdgeInsets.only(left: 10.0, top: 5.0),
            child: Text(
              model.documentsName,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 2.0),
            child: Row(
              children: [
                Text("Asal Dokumen : ",
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 14, color: Colors.white)),
                Text(model.originFrom,
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
                Text(model.originFrom,
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
                Text("Total TTE : ",
                    textAlign: TextAlign.left,
                    // model.originFrom,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 14, color: Colors.white)),
                Text(model.originFrom,
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 14, color: Colors.white)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
