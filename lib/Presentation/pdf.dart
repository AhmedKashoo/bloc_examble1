import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';

class Pdf extends StatefulWidget {
  const Pdf({Key? key}) : super(key: key);

  @override
  State<Pdf> createState() => _PdfState();
}

class _PdfState extends State<Pdf> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    final p='http://192.168.0.201:8080/souq/catalog/%D9%81%D9%8A%D9%81%D8%B1%20-%20%D9%83%D8%A7%D8%AC%D9%88%D8%A7%D9%84%20%D9%85%D8%AD%D8%AC%D8%A8%D8%A7%D8%AA.pdf?jasper=catalog&id=179';

    return Scaffold(
      appBar: AppBar(
        title: IconButton(onPressed: ()async{
          var httpClient = new HttpClient();
          var request = await httpClient.getUrl(Uri.parse('http://192.168.0.201:8080/souq/catalog/%D9%81%D9%8A%D9%81%D8%B1%20-%20%D9%83%D8%A7%D8%AC%D9%88%D8%A7%D9%84%20%D9%85%D8%AD%D8%AC%D8%A8%D8%A7%D8%AA.pdf?jasper=catalog&id=179'));
          var response = await request.close();
          var bytes = await consolidateHttpClientResponseBytes(response);
          String dir = (await getApplicationDocumentsDirectory()).path;
          File file = new File('$dir/dddd');
          await file.writeAsBytes(bytes);
        },icon: Icon(Icons.ac_unit),),
        leading: IconButton(onPressed: ()async{

          await    Share.shareFiles([p],text: "kkk");

        },icon: Icon(Icons.share),),

      ),
      body: Center(child:
      SfPdfViewer.network('http://192.168.0.201:8080/souq/catalog/%D9%81%D9%8A%D9%81%D8%B1%20-%20%D9%83%D8%A7%D8%AC%D9%88%D8%A7%D9%84%20%D9%85%D8%AD%D8%AC%D8%A8%D8%A7%D8%AA.pdf?jasper=catalog&id=179')),

    );
  }
}
