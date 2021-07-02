import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:profile_page/Drugs.dart';
import 'package:profile_page/LogIn.dart';
import 'package:profile_page/home_page.dart';

Future<void> main() async {
  runApp(PdfPreviewScreen());
}

class PdfPreviewScreen extends StatefulWidget {
  static String id = "PdfPreviewScreen";

  final String title = 'Document';

  @override
  _PdfPreviewScreenState createState() => _PdfPreviewScreenState();
}

class _PdfPreviewScreenState extends State<PdfPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color.fromARGB(255, 79, 99, 115),
        accentColor:  Color.fromARGB(255, 30, 126, 194),),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: Color.fromARGB(255, 79, 99, 115)),

        body: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 79, 99, 115),
          ),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Profile')
                  .doc(LogIn.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                print(HomePage.dataList);
                return PdfPreview(
                    build: (format) => _generatePdf(
                        format,
                        "Name:${snapshot.data['fName']}${snapshot.data['lName']} \nPhone:${snapshot.data['phone']}\nGender:${snapshot.data['gender']}\nE-Mail:${snapshot.data['email']}\n",
                        HomePage.dataList.toString(),
                        Drugs.dataList.toString()));
              }),
        ),

      ),
    );
  }

  Future<Uint8List> _generatePdf(
      PdfPageFormat format, String title, String title2, String title3) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        margin: pw.EdgeInsets.all(15),

        build: (context) {
          return pw.Column(

            children: [
              pw.Paragraph(
                  text: '--------------------------------Info--------------------------------' +
                      '\n' +
                      title +
                      '\n' +
                      '--------------------------------Diseases--------------------------------' +
                      '\n' +
                      title2 +
                      '\n' +
                      '--------------------------------Drugs--------------------------------' +
                      '\n' +
                      title3,
                  style: pw.TextStyle(font: font, fontSize: 18)),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}
