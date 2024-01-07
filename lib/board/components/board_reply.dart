import 'package:bside_todolist/common/components/ui/system/colors.dart';
import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoardReply extends StatelessWidget {
  const BoardReply({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Row(
            children: [
              Text(
                '별별노트',
                style: MyTexts.KR14800.copyWith(color: MyColors.starGreen),
              ),
              const SizedBox(width: 16),
              const Text(
                '2023.12.24',
                style: MyTexts.KR14400,
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            '딴은 밤을 세워 우는 벌레는 부끄러운 이름을 슬퍼하는 까닭입니다. 나는 무엇인지 그리워 이 많은 별빛이 내린 언덕 위에 내 이름자를 써보고 흙으로 덮어 버리었읍니다. 어머님, 그리고 당신은 멀리 북간도에 계십니다. ',
            style: MyTexts.KR14400,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
