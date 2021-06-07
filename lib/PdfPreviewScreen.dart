import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:share/share.dart';
class PdfPreviewScreen extends StatelessWidget {
  final String path;

  PdfPreviewScreen({this.path});

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        title: Text('History document'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share('$path');
            },
          ),
        ],

      ),
      path: path,
    );
  }
}