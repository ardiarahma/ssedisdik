import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ssedisdik/src/common_widgets/custom_appbar_widget.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/constants/text_strings.dart';
import 'package:ssedisdik/src/features/authentication/models/documents_model.dart';

class DocItemDetailScreen extends StatefulWidget {
  final DocumentsModel model;

  const DocItemDetailScreen({Key? key, required this.model}) : super(key: key);

  @override
  State<DocItemDetailScreen> createState() => _DocItemDetailScreenState();
}

class _DocItemDetailScreenState extends State<DocItemDetailScreen> {
  List<Widget> buildDetails() {
    var details = [
      {'label': 'Nomor/Nama Surat', 'value': widget.model.documentName},
      {'label': 'Kategori Surat', 'value': widget.model.documentCategory},
      {'label': 'Asal Surat', 'value': widget.model.documentFrom},
      {'label': 'Tanggal Unggah', 'value': widget.model.documentCreatedAt},
      {'label': 'Oleh', 'value': widget.model.documentCreatedBy},
      // Add more details here
    ];

    return details.map((detail) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            Expanded(flex: 3, child: Text(detail['label'] ?? '')),
            Expanded(flex: 5, child: Text(': ${detail['value']}')),
          ],
        ),
      );
    }).toList();
  }

  Widget getStatusChip(String status) {
    Color color;

    switch (status) {
      case 'Draft':
        color = Colors.blue;
        break;
      case 'Terkirim':
        color = Colors.orange;
        break;
      case 'Selesai':
        color = Colors.green;
        break;
      default:
        color = Colors.grey;
    }

    return Chip(
      label: Text(status, style: const TextStyle(color: Colors.white)),
      backgroundColor: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;

    return ColorfulSafeArea(
      color: primaryColor,
      overflowRules: const OverflowRules.only(top: false, bottom: true),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // -- AppBar
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
                        tItemDetailsTitle,
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
                      left: tHomePadding,
                      right: tHomePadding,
                      top: tHomePadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // -- Document Details Title
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(tDetailTitle,
                              style: txtTheme.displayLarge?.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      SizedBox(
                        height: 10,
                      ),
                      // -- End of Document Details Title

                      // -- Document Details
                      Column(
                        children: buildDetails(),
                      ),
                      // -- End of Document Details

                      // -- Preview Document
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              child: const Text('Lihat Dokumen'))
                        ],
                      ),
                      // -- End of Preview Document

                      // -- Detail Destination
                      const SizedBox(height: 20),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text('Detail TTE',
                              style: txtTheme.displayLarge?.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      const SizedBox(
                        height: 10,
                      ),
                      // -- End of Detail Destination

                      // -- Table of Contents
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            dataTableTheme: DataTableThemeData(
                              headingRowColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                return Color(primaryColor
                                    .value); // Use the same color as your app bar
                              }),
                              dataRowColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                return Colors
                                    .transparent; // Use transparent color for row color
                              }),
                              dividerThickness: 1.0,
                              // Set border here
                            ),
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: DataTable(
                              columns: const <DataColumn>[
                                DataColumn(
                                  label: DefaultTextStyle(
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                    child: Text('No'),
                                  ),
                                ),
                                DataColumn(
                                  label: DefaultTextStyle(
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                    child: Text('Tag'),
                                  ),
                                ),
                                DataColumn(
                                  label: DefaultTextStyle(
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                    child: Text('TTE'),
                                  ),
                                ),
                                DataColumn(
                                  label: DefaultTextStyle(
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                    child: Text('Kirim Ke'),
                                  ),
                                ),
                                DataColumn(
                                  label: DefaultTextStyle(
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                    child: Text('Pejabat'),
                                  ),
                                ),
                                DataColumn(
                                  label: DefaultTextStyle(
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                    child: Text('Status'),
                                  ),
                                ),
                              ],
                              rows: <DataRow>[
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('1')),
                                    DataCell(Text('#')),
                                    DataCell(Text('TTE')),
                                    DataCell(Text('DINAS PENDIDIKAN')),
                                    DataCell(Text('Purwosusilo')),
                                    DataCell(getStatusChip(
                                        widget.model.documentStatus)),
                                  ],
                                ),
                                // Add more DataRow for other details
                              ],
                            ),
                          ),
                        ),
                      ),
                      // -- End of Table of Contents

                      // -- Submi† TTE
                      const SizedBox(height: 20),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text('Pengajuan TTE',
                              style: txtTheme.displayLarge?.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      const SizedBox(
                        height: 10,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              20.0), // Adjust the radius as needed
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Masukkan passphrase',
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                ),
                                // Other TextField properties here
                              ),
                            ),
                            Container(
                              height: 48.0, // Adjust the height as needed
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle button press
                                },
                                child: Text('Ajukan TTE'),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        19.0), // Adjust the radius as needed
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
