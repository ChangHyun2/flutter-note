import 'package:bside_todolist/common/components/ui/button.dart';
import 'package:bside_todolist/common/components/ui/system/colors.dart';
import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  Future<void> save() async {
    print('save start');
    print('save done');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('정보 수정', style: MyTexts.KR17700),
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, color: MyColors.blackBasic),
            onPressed: () {
              context.pop();
            },
          ),
          actions: [
            Center(
              child: MyButton(
                type: 'transparent',
                onPressed: null,
                child: const Text('저장'),
              ),
            ),
            SizedBox(width: 10)
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: const Placeholder(),
        bottomNavigationBar: null,
      ),
    );
  }
}
