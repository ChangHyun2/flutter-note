import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/components/ui/system/colors.dart';
import '../../common/components/ui/system/texts.dart';
import '../../common/provider/auth_provider.dart';
import 'package:go_router/go_router.dart';

class HomeProfile extends StatelessWidget {
  const HomeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = context.watch<AuthProvider>();
    var kakaoAccount = authProvider.kakaoUser?.kakaoAccount;
    var name = kakaoAccount?.profile?.nickname;
    var profileUrl = kakaoAccount?.profile?.thumbnailImageUrl;

    return Container(
      height: 200,
      decoration: BoxDecoration(color: MyColors.starGreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90,
            padding: EdgeInsets.fromLTRB(16, 16, 16, 13),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '일이삼사오육칠팔구십일이삼사오육',
                  style: MyTexts.KRBold17.copyWith(
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.go('/profile');
                  },
                  child: Column(
                    children: [
                      profileUrl != null
                          ? CircleAvatar(
                              radius: 16,
                              backgroundImage: NetworkImage(profileUrl),
                              backgroundColor: Colors.transparent,
                            )
                          : const CircleAvatar(
                              radius: 30.0,
                              backgroundColor: Colors.transparent,
                            ),
                      const SizedBox(height: 8),
                      name != null
                          ? Text(
                              name,
                              style: MyTexts.KRMedium14.copyWith(
                                color: Colors.white,
                              ),
                            )
                          : Container()
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
