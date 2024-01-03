import 'dart:convert' show jsonEncode;
import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'http://3.36.89.204:8080/api')
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

@JsonSerializable()
class Subject {
  const Subject({
    required this.subjectId,
    required this.subjectName,
    required this.subjectSize,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  final String subjectId;
  final String subjectName;
  final int subjectSize;
  final String createdAt;
  final String modifiedAt;

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}
