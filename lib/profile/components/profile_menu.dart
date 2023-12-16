import 'package:bside_todolist/common/components/ui/system/colors.dart';
import 'package:bside_todolist/common/components/ui/system/colors.dart';
import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:bside_todolist/common/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = context.watch<AuthProvider>();

    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Divider(
          thickness: 1,
          color: MyColors.cardStroke,
          height: 1,
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          title: Text('의견 남기기', style: MyTexts.KR16700),
          trailing: Icon(
            Icons.chevron_right,
            color: MyColors.gray900,
          ),
          onTap: () {},
        ),
        Divider(
          thickness: 1,
          color: MyColors.cardStroke,
          height: 1,
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          title: Text('현재 앱 버전', style: MyTexts.KR16700),
          trailing: Icon(Icons.chevron_right, color: MyColors.gray900),
          onTap: () {},
        ),
        Divider(
          thickness: 1,
          color: MyColors.cardStroke,
          height: 1,
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          title: Text('서비스 약관', style: MyTexts.KR16700),
          trailing: Icon(Icons.chevron_right, color: MyColors.gray900),
          onTap: () {},
        ),
        Divider(
          thickness: 1,
          color: MyColors.cardStroke,
          height: 1,
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          title: Text('로그아웃', style: MyTexts.KR16700),
          trailing: Icon(Icons.chevron_right, color: MyColors.gray900),
          onTap: () {
            authProvider.kakaoLogout().then((_) {
              context.go('/login');
            });
          },
        ),
        Divider(
          thickness: 1,
          color: MyColors.cardStroke,
          height: 1,
        ),
      ],
    );
  }
}
