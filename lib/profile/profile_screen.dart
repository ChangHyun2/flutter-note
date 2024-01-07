import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:bside_todolist/common/provider/auth_provider.dart';
import 'package:bside_todolist/common/provider/user.dart';
import 'package:bside_todolist/profile/components/profile_feedback.dart';
import 'package:bside_todolist/profile/components/profile_menu.dart';
import 'package:bside_todolist/profile/components/profile_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: const Text(
                '내정보',
                style: MyTexts.KR24800,
              ),
            ),
            const SizedBox(height: 12),
            ProfileUser(),
            const SizedBox(height: 24),
            const ProfileFeedback(),
            const SizedBox(
              height: 24,
            ),
            const ProfileMenu(),
          ],
        ),
      ),
    );
  }
}
