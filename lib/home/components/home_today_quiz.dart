import 'package:flutter/material.dart';

import '../../common/components/ui/system/colors.dart';
import '../../common/components/ui/system/texts.dart';

class HomeTodayQuiz extends StatelessWidget {
  const HomeTodayQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(36),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 95, width: 113),
          const SizedBox(width: 36),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('수험생123 님을 위한', style: MyTexts.KRBold17),
                const Text('오늘의 퀴즈!', style: MyTexts.KRBold17),
                const SizedBox(height: 14),
                ElevatedButton(
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
