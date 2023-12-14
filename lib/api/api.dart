import 'dart:convert' show jsonEncode;
import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/auth/kakao')
  Future<HttpResponse<Token>> postAuthKakao(
    @Body() PostAuthKakaoRequest request,
  );
}

@JsonSerializable()
class PostAuthKakaoRequest {
  const PostAuthKakaoRequest({
    required this.id,
    required this.email,
    required this.nickname,
    required this.profileUrl,
  });

  factory PostAuthKakaoRequest.fromJson(Map<String, dynamic> json) =>
      _$PostAuthKakaoRequestFromJson(json);

  final int id;
  final String email;
  final String nickname;
  final String profileUrl;

  Map<String, dynamic> toJson() => _$PostAuthKakaoRequestToJson(this);
}

@JsonSerializable()
class Token {
  const Token({required this.accessToken});

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  final String accessToken;

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}