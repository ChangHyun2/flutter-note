import 'package:bside_todolist/common/components/ui/button.dart';
import 'package:bside_todolist/common/components/ui/card_wrapper.dart';
import 'package:bside_todolist/common/provider/subjects.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeCreateQuiz extends ConsumerWidget {
  const HomeCreateQuiz({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var subjectsRiver = ref.watch(subjectsProvider);
    var hasQuiz =
        subjectsRiver.hasValue && subjectsRiver.value![0].subjectSize != 0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CardWrapper(
        borderRadius: 8,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
          child: Column(
            children: [
              const Text('복습이 필요한 문제를'),
              const Text('쏙쏙 골라서 나만의 시험을 만들어 보세요'),
              const SizedBox(height: 16),
              SizedBox(
                width: 260,
                child: MyButton(
                  onPressed: hasQuiz
                      ? () {
                          context.go('/folders/create');
                        }
                      : null,
                  type: MyButtonType.starGreen,
                  child: const Text('나만의 퀴즈 만들기'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
