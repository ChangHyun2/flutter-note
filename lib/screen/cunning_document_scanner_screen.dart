import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';

class CunningDocumentScannerScreen extends StatefulWidget {
  const CunningDocumentScannerScreen({Key? key}) : super(key: key);

  @override
  State<CunningDocumentScannerScreen> createState() =>
      _CunningDocumentScannerScreenState();
}

class _CunningDocumentScannerScreenState
    extends State<CunningDocumentScannerScreen> {
  List<String> _pictures = [];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: onPressed, child: const Text("Add Pictures")),
            for (var picture in _pictures) Image.file(File(picture))
          ],
        )),
      ),
    );
  }

  void onPressed() async {
    List<String> pictures;
    try {
      print('start');
      pictures = await CunningDocumentScanner.getPictures(true) ?? [];
      print('end');
      if (!mounted) return;
      setState(() {
        _pictures = pictures;
      });
    } catch (exception) {
      print(exception);
      // Handle exception here
    }
  }
}
