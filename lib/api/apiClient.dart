import 'package:bside_todolist/api/api.dart';
import 'package:bside_todolist/common/constants/star_shared_preferences_keys.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

RestClient getApiClient() {
  final dio = Dio();

  dio.interceptors.add(
    InterceptorsWrapper(onRequest: (options, handler) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? starAccessToken =
          prefs.getString(StarSharedPreferencesKeys.starAccessToken);

      if (starAccessToken != null) {
        options.headers['Authorization'] = 'Bearer $starAccessToken';
      }

      return handler.next(options);
    }, onError: (DioException e, handler) async {
      if (e.response?.statusCode == 401) {
        try {
          SharedPreferences prefs = await SharedPreferences.getInstance();

          int? kakaoId = prefs.getInt(StarSharedPreferencesKeys.kakaoId);
          String? kakaoEmail =
              prefs.getString(StarSharedPreferencesKeys.kakaoEmail);
          String? kakaoNickname =
              prefs.getString(StarSharedPreferencesKeys.kakaoNickname);
          String? kakaoProfileUrl =
              prefs.getString(StarSharedPreferencesKeys.kakaoProfileUrl);

          if (kakaoId != null &&
              kakaoEmail != null &&
              kakaoNickname != null &&
              kakaoProfileUrl != null) {
            PostAuthKakaoRequest postAuthKakaoRequest = PostAuthKakaoRequest(
              id: kakaoId,
              email: kakaoEmail,
              nickname: kakaoNickname,
              profileUrl: kakaoProfileUrl,
            );

            print('refresh token start');

            try {
              var value =
                  await getApiClient().postAuthKakao(postAuthKakaoRequest);
              String accessToken = value.data.accessToken;
              e.requestOptions.headers['Authorization'] = 'Bearer $accessToken';
              prefs.setString(
                  StarSharedPreferencesKeys.starAccessToken, accessToken);
              print('refresh token success');

              return handler.resolve(await dio.fetch(e.requestOptions));
            } on DioException catch (e) {
              print('refresh toekn failure');

              return handler.next(e);
            }
          }
        } on DioException catch (e) {
          return handler.next(e);
        }

        // Repeat the request with the updated header
      }
      return handler.next(e);
    }),
  );

  final apiClient = RestClient(dio);
  return apiClient;
}
