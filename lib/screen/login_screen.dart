import 'dart:convert';

import 'package:bside_todolist/api/api.dart';
import 'package:bside_todolist/api/apiClient.dart';
import 'package:bside_todolist/design_system/colors.dart';
import 'package:bside_todolist/design_system/texts.dart';
import 'package:bside_todolist/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:lottie/lottie.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../design_system/texts.dart';
import '../design_system/texts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var auth = context.watch<AuthProvider>();
    RestClient apiClient = getApiClient();

    return Scaffold(
      backgroundColor: MyColors.starGreen,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 130,
              child: Container(
                height: 370,
                child: Lottie.asset('assets/splash.json'),
              ),
            ),
            Positioned(
              bottom: 66,
              child: Column(
                children: [
                  Text(
                    '지금 별별노트에 가입하고',
                    style: MyTexts.KRRegular14.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '틀린 문제를 다시 풀어보세요!',
                    style: MyTexts.KRRegular14.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.08),
                          offset: Offset(2, 4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.kakao,
                        fixedSize: Size(300, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () async {
                        var kakaoUser = await auth.kakaoLogin();

                        User user = await UserApi.instance.me();

                        if (user.kakaoAccount != null) {
                          final kakaoAccount = user.kakaoAccount!;

                          print(kakaoAccount.toString());
                          PostAuthKakaoRequest postAuthKakaoRequest =
                              PostAuthKakaoRequest(
                                  id: user.id,
                                  email: kakaoAccount.email!,
                                  nickname: kakaoAccount.profile!.nickname!,
                                  profileUrl:
                                      kakaoAccount.profile!.thumbnailImageUrl!);

                          print(postAuthKakaoRequest.toJson());

                          apiClient
                              .postAuthKakao(postAuthKakaoRequest)
                              .then((value) {
                            print(value.response.statusCode);
                            print(value.data);
                            context.go('/problems');
                          }).catchError((e) {
                            print(e.toString());
                          });
                        }
                      },
                      child: const Text(
                        '카카오톡으로 로그인',
                        style: MyTexts.KRRegular16,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
