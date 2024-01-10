// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:bside_todolist/api/apiClient.dart';
import 'package:bside_todolist/common/constants/star_shared_preferences_keys.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/api.dart';

class AuthProvider extends ChangeNotifier {
  User? _kakaoUser;

  set kakaoUser(User? kakaoUser) {
    _kakaoUser = kakaoUser;
    print('notify');
    notifyListeners();
  }

  User? get kakaoUser => _kakaoUser;

  Future<User?> kakaoCheckUser() async {
    try {
      AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();

      User user = await UserApi.instance.me();
      print('사용자 정보 요청 성공'
          '\n회원번호: ${user.id}'
          '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
          '\n이메일: ${user.kakaoAccount?.email}'
          '\n프사: ${user.kakaoAccount?.profile?.thumbnailImageUrl}');

      print('토큰 정보 보기 성공'
          '\n회원정보: ${tokenInfo.id}'
          '\n만료시간: ${tokenInfo.expiresIn} 초'
          '\n${tokenInfo.toJson()}');

      kakaoUser = await UserApi.instance.me();

      return kakaoUser;
    } catch (error) {
      print('kakaocheckuser failure');
      return null;
    }
  }

  Future kakaoLogout() async {
    await UserApi.instance.logout();
    kakaoUser = null;
    return kakaoUser;
  }

  Future starLogin() async {
    try {
      User user = await UserApi.instance.me();
      if (user.kakaoAccount != null) {
        final kakaoAccount = user.kakaoAccount!;
        print('star login start');
        print(kakaoAccount.profile!.nickname);
        PostAuthKakaoRequest postAuthKakaoRequest = PostAuthKakaoRequest(
            id: user.id,
            email: kakaoAccount.email!,
            nickname: kakaoAccount.profile!.nickname!,
            profileUrl: kakaoAccount.profile!.thumbnailImageUrl!);

        var value = await getApiClient().postAuthKakao(postAuthKakaoRequest);
        print('star login success');

        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setInt(StarSharedPreferencesKeys.kakaoId, user.id);
        prefs.setString(
            StarSharedPreferencesKeys.kakaoEmail, kakaoAccount.email!);
        prefs.setString(StarSharedPreferencesKeys.kakaoNickname,
            kakaoAccount.profile!.nickname!);
        prefs.setString(StarSharedPreferencesKeys.kakaoProfileUrl,
            kakaoAccount.profile!.thumbnailImageUrl!);

        prefs.setString(
            StarSharedPreferencesKeys.starAccessToken, value.data.accessToken);
        print(value.data.accessToken);
      }
    } catch (error) {
      print('star login failure');
      print(error.toString());
      rethrow;
    }
  }

  Future kakaoLogin() async {
    var user = await kakaoCheckUser();
    if (user != null) {
      return user;
    }

    // 카카오톡 실행 가능 여부 확인
    // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공');
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return null;
        }

        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          await UserApi.instance.loginWithKakaoAccount();
          print('카카오계정으로 로그인 성공');
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
          return null;
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공');
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
        return null;
      }
    }
    return await kakaoCheckUser();
  }
}
