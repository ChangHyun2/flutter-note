import 'package:bside_todolist/common/provider/subjects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/components/ui/system/colors.dart';
import '../../common/components/ui/system/texts.dart';

class HomeTodayQuiz extends ConsumerWidget {
  const HomeTodayQuiz({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var subjectsRiver = ref.watch(subjectsProvider);
    var hasQuiz =
        subjectsRiver.hasValue && subjectsRiver.value![0].subjectSize != 0;

    return Container(
      padding: const EdgeInsets.all(36),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            height: 95,
            width: 113,
            'assets/home_star.svg',
            semanticsLabel: 'star character',
          ),
          const SizedBox(width: 36),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('수험생123 님을 위한', style: MyTexts.KRBold17),
                const Text('오늘의 퀴즈!', style: MyTexts.KRBold17),
                const SizedBox(height: 14),
                hasQuiz
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.starGreen,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), //
                            // <-- Radius
                          ),
                          minimumSize: const Size(170, 37),
                        ),
                        onPressed: () => {},
                        child: Text(
                          '오늘의 퀴즈 풀기',
                          style: MyTexts.KRRegular14.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.starGreen,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), //
                            // <-- Radius
                          ),
                          minimumSize: const Size(170, 37),
                        ),
                        onPressed: () => {},
                        child: Text(
                          '문제 등록하기',
                          style: MyTexts.KRRegular14.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
