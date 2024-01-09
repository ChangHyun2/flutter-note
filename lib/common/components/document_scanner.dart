import 'dart:io';
import 'package:bside_todolist/common/components/ui/card_wrapper.dart';
import 'package:bside_todolist/common/components/ui/system/colors.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';

class DocumentScanner extends StatefulWidget {
  String title;
  double height;

  DocumentScanner({
    Key? key,
    required this.title,
    required this.height,
  }) : super(key: key);

  @override
  State<DocumentScanner> createState() => _DocumentScannerState();
}

class _DocumentScannerState extends State<DocumentScanner> {
  List<String> _pictures = [];
  bool isUploaded = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: CardWrapper(
        borderRadius: 4,
        child: SizedBox(
          height: widget.height,
          width: double.infinity,
          child: _pictures.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.camera_alt_outlined,
                      color: MyColors.starGreen,
                      size: 24,
                    ),
                    const SizedBox(height: 26),
                    Text(widget.title),
                  ],
                )
              : Column(
                  children: [
                    for (var picture in _pictures) Image.file(File(picture))
                  ],
                ),
        ),
      ),
    );
  }

  void onPressed() async {
    List<String> pictures;

    try {
      pictures = await CunningDocumentScanner.getPictures(true) ?? [];

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
