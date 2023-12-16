import 'package:bside_todolist/common/components/ui/card_wrapper.dart';
import 'package:bside_todolist/common/components/ui/system/colors.dart';
import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:bside_todolist/common/provider/auth_provider.dart';
import 'package:bside_todolist/profile/components/profile_feedback.dart';
import 'package:bside_todolist/profile/components/profile_menu.dart';
import 'package:bside_todolist/profile/components/profile_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = context.watch<AuthProvider>();

    String? nickname = authProvider.kakaoUser?.kakaoAccount?.profile?.nickname;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 32),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Text(
              '내정보',
              style: MyTexts.KR24800,
            ),
          ),
          SizedBox(height: 12),
          ProfileUser(),
          SizedBox(height: 24),
          ProfileFeedback(),
          SizedBox(
            height: 24,
          ),
          ProfileMenu(),
        ],
      ),
    );
  }
}
