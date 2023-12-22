import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:flutter/material.dart';

class QuizCreateScreen extends StatelessWidget {
  const QuizCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          //   이미ㅣㅈ cunning document

          SizedBox(height: 24),
          Text('문제 정보', style: MyTexts.KR17700),
          SizedBox(height: 24),
          Text('문제 제목', style: MyTexts.KR14700),
        ],
      ),
    );
  }
}
