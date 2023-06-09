import 'package:flutter/material.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({super.key});

  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('this is Dokumen Page'),
      ),
    );
  }
}
