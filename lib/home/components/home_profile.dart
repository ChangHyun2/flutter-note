import 'package:bside_todolist/common/provider/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/components/ui/system/colors.dart';
import '../../common/components/ui/system/texts.dart';
import 'package:go_router/go_router.dart';

class HomeProfile extends ConsumerWidget {
  const HomeProfile({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var user = ref.watch(userRiverProvider);
    var name = user.value?.nickName ?? '';
    var profileUrl = user.value?.profileUrl;
    var comment = user.value?.comment ?? '반복이 합격의 비밀!';

    return Container(
      height: 200,
      decoration: const BoxDecoration(color: MyColors.starGreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 13),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  comment,
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
