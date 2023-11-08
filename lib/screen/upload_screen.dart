import 'package:flutter/cupertino.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => {},
      child: const Text('hello'),
    );
  }
}
