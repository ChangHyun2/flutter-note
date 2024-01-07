import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoardQuestionDetail extends StatelessWidget {
  final VoidCallback onCommentTap;
  const BoardQuestionDetail({Key? key, required this.onCommentTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 92,
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: const Color(0xFFEFEFEF), width: 1),
                  color: const Color(0xFFFCFCFC),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '답변완료',
                      style: MyTexts.KRGreen16400,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                '이 서비스 넘 좋다!',
                style: MyTexts.KR16700,
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Row(
            children: [
              Text(
                '수험생123',
                style: MyTexts.KR14800,
              ),
              SizedBox(width: 16),
              Text(
                '2023.12.24',
                style: MyTexts.KR14400,
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            '나는 무엇인지 그리워 이 많은 별빛이 내린 언덕 위에 내 이름자를 써보고 흙으로 덮어 버리었읍니다. 딴은 밤을 세워 우는 벌레는 부끄러운 이름을 슬퍼하는 까닭입니다. 어머님, 그리고 당신은 멀리 북간도에 계십니다. 계절이 지나가는 하늘에는 가을로 가득 차 있습니다. 나는 아무 걱정도 없이 가을 속의 별들을 다 헬 듯합니다. 계절이 지나가는 하늘에는 가을로 가득 차 있습니다. 나는 아무 걱정도 없이 가을 속의 별들을 다 헬 듯합니다.',
            style: MyTexts.KR14400,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/like.svg',
                width: 20.176,
                height: 18.308,
              ),
              const SizedBox(width: 8),
              const Text(
                '좋아요 0',
                style: MyTexts.KRGray14400,
              ),
              const SizedBox(width: 16),
              InkWell(
                  onTap: () {
                    onCommentTap();
                  },
                  child: Row(children: [
                    SvgPicture.asset(
                      'assets/icons/reply.svg',
                      width: 18,
                      height: 17.89,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '댓글 2',
                      style: MyTexts.KRGray14400,
                    ),
                  ])),
            ],
          ),
        ],
      ),
    );
  }
}
