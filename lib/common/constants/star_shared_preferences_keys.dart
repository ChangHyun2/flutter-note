const String prefix = 'star_';

class StarSharedPreferencesKeys {
  StarSharedPreferencesKeys._();

  static const String starAccessToken = '${prefix}starAccessToken';

  // refresh token 대체
  static const String kakaoId = '${prefix}kakaoId';
  static const String kakaoEmail = '${prefix}kakaoEmail';
  static const String kakaoNickname = '${prefix}kakaoNickname';
  static const String kakaoProfileUrl = '${prefix}kakaoProfileUrl';
}
