import 'package:bside_todolist/common/components/ui/button.dart';
import 'package:bside_todolist/common/components/ui/card_wrapper.dart';
import 'package:flutter/material.dart';

class HomeCreateQuiz extends StatelessWidget {
  const HomeCreateQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CardWrapper(
        borderRadius: 8,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 40),
          child: Column(
            children: [
              Text('복습이 필요한 문제를'),
              Text('쏙쏙 골라서 나만의 시험을 만들어 보세요'),
              SizedBox(height: 16),
              SizedBox(
                width: 260,
                child: MyButton(
                  child: Text('나만의 퀴즈 만들기'),
                  onPressed: () {
                    print('hello');
                  },
                  type: MyButtonType.starGreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
