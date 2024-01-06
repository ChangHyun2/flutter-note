import 'package:bside_todolist/common/components/ui/card_wrapper.dart';
import 'package:bside_todolist/common/components/ui/system/colors.dart';
import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:bside_todolist/common/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = context.watch<AuthProvider>();

    String? nickname = authProvider.kakaoUser?.kakaoAccount?.profile?.nickname;

    var reviewTimes = '1시간 8분';
    var checkinDays = '3일';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CardWrapper(
          borderRadius: 8,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nickname ?? '',
                              style: MyTexts.KR14400.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '반복이 합격의 비법!',
                              style: MyTexts.KR14400.copyWith(height: 1.5),
                            )
                          ],
                        )
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () {
                        print('helol');
                        context.go('/profile/edit');
                      },
                    )
                  ],
                ),
              ),
              const Divider(
                  color: MyColors.cardStroke, thickness: 1, height: 1),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        children: [
                          const Text('⏱️ 총 복습 시간'),
                          Text(reviewTimes),
                        ],
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    color: MyColors.cardStroke,
                    width: 1,
                    thickness: 1,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        children: [
                          const Text('⏱️ 누적 출석'),
                          Text(checkinDays),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
