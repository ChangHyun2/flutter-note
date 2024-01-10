// dialogs.dart

import 'package:flutter/cupertino.dart';
import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:flutter/material.dart';

class QuizRenameModal extends StatelessWidget {
  const QuizRenameModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoAlertDialog(
      title: Text(
        "폴더명 변경",
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
          child: Text("삭제"),
        )
      ],
    );
  }
}
