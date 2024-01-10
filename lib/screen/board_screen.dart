import 'package:bside_todolist/board/components/board_question.dart';
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

class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = context.watch<AuthProvider>();
    String? nickname = authProvider.kakaoUser?.kakaoAccount?.profile?.nickname;

    return SafeArea(
        child: KeyboardDismissOnTap(
            child: Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  leading: IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                  title: const Text(
                    '문의게시판',
                    style: MyTexts.KR17700,
                  ),
                  centerTitle: true,
                ),
                body: Stack(children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 36,
                        ),
                        Container(
                          width: 343,
                          height: 173,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: const Color(0xFFEFEFEF), width: 1),
                            color: const Color(0xFFFCFCFC),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '불편했던 점, 칭찬 점 등을 남겨주시면\n더 좋은 서비스를 만드는데 도움이 됩니다!',
                                style: MyTexts.KRBlack16400,
                              ),
                              const SizedBox(height: 24),
                              // ElevatedButton 대신 Container로 만들어진 커스텀 버튼
                              GestureDetector(
                                onTap: () {
                                  context.go('/board/opinion');
                                  // 버튼 클릭 시 실행되는 로직
                                },
                                child: Container(
                                  width: 120,
                                  height: 42,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: const Color(0xFF58DB67),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '의견남기기',
                                      style: gothicRegular14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // 추가된 박스 2
                        InkWell(
                          onTap: () {
                            context.go('/board/detail');
                          },
                          child: const BoardQuestion(),
                        ),
                        const BoardQuestion(),
                        const BoardQuestion(),
                        const BoardQuestion(),
                      ],
                    ),
                  )
                ]))));
  }
}
