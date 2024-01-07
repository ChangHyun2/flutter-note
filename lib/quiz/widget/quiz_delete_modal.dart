// dialogs.dart

import 'package:flutter/cupertino.dart';
import 'package:bside_todolist/common/components/ui/system/texts.dart';

class QuizDeleteModal extends StatelessWidget {
  const QuizDeleteModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoAlertDialog(
      title: Text(
        "폴더를 삭제 하시겠습니까?",
        style: MyTexts.KR16700,
      ),
      content: Text(
        "해당 폴더의 문제도 삭제 됩니다.",
        style: MyTexts.KR14400,
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
