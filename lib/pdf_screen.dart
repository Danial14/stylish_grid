import 'package:flutter/material.dart';
import 'package:stylish_grid/main.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfScreen extends StatelessWidget {
  const PdfScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
          return MyApp();
        }));
        return true;
      },
      child: Scaffold(
        body: SfPdfViewer.asset("assets/Fortline_Company profile.pdf"),
      ),
    );
  }
}
