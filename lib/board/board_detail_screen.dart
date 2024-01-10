import 'package:bside_todolist/board/components/board_question.dart';
import 'package:bside_todolist/board/components/board_question_detail.dart';
import 'package:bside_todolist/board/components/board_reply.dart';
import 'package:bside_todolist/common/components/ui/card_wrapper.dart';
import 'package:bside_todolist/common/components/ui/system/colors.dart';
import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:bside_todolist/common/provider/auth_provider.dart';
import 'package:bside_todolist/profile/components/profile_feedback.dart';
import 'package:bside_todolist/profile/components/profile_menu.dart';
import 'package:bside_todolist/profile/components/profile_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BoardDetailScreen extends StatelessWidget {
  const BoardDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = context.watch<AuthProvider>();
    String? nickname = authProvider.kakaoUser?.kakaoAccount?.profile?.nickname;
    bool reply = false;

    return Stack(children: [
      SingleChildScrollView(
          child: Column(
        children: [
          // 추가된 박스 2
          BoardQuestionDetail(
            onCommentTap: () {
              reply = true;
            },
          ),
          const Divider(
            thickness: 1,
            color: MyColors.cardStroke,
            height: 1,
          ),
          const BoardReply(),
          const BoardReply(),

          reply == true
              ? Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '수험생789',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Color(0xffEFEFEF),
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0xfffcfcfc),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '댓글을 입력해주세요',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Color(0xffEFEFEF),
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0xfffcfcfc),
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),

          const SizedBox(
            height: 88,
          ),
        ],
      ))
    ]);
  }
}
