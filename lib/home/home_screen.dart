import 'package:bside_todolist/api/api.dart';
import 'package:bside_todolist/common/components/ui/button.dart';
import 'package:bside_todolist/common/components/ui/card_wrapper.dart';
import 'package:bside_todolist/common/components/ui/system/colors.dart';
import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:bside_todolist/common/provider/auth_provider.dart';
import 'package:bside_todolist/home/components/home_create_quiz.dart';
import 'package:bside_todolist/home/components/home_subjects.dart';
import 'package:bside_todolist/home/components/home_profile.dart';
import 'package:bside_todolist/home/components/home_today_quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = context.watch<AuthProvider>();
    var kakaoAccount = authProvider.kakaoUser?.kakaoAccount;
    var name = kakaoAccount?.profile?.nickname;
    var profileUrl = kakaoAccount?.profile?.thumbnailImageUrl;

    return SingleChildScrollView(
      child: Stack(
        children: [
          const HomeProfile(),
          Column(
            children: [
              const SizedBox(height: 90),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeTodayQuiz(),
                    const SizedBox(height: 20),
                    const HomeSubjects(),
                    const SizedBox(height: 56),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Text('퀴즈 만들기 ✍️', style: MyTexts.KRBold17),
                    ),
                    const SizedBox(height: 16),
                    const HomeCreateQuiz(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
