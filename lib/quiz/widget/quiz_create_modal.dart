// dialogs.dart

import 'package:flutter/cupertino.dart';
import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:flutter/material.dart';

class QuizCreateModal extends StatelessWidget {
  const QuizCreateModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoAlertDialog(
      title: Text(
        "폴더 생성",
        style: MyTexts.KR16700,
      ),
      content: Card(
        color: Colors.transparent,
        elevation: 0.0,
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: "Nama",
                  filled: true,
                  fillColor: Color(0x000fffff)),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text("취소"),
        ),
        CupertinoDialogAction(
          child: Text("저장"),
        )
      ],
    );
  }
}
