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

  @MultiPart()
  @POST('/images/questions')
  Future<HttpResponse<PostImagesQuestionsResponse>> postImagesQuestions(
    @Part() List<MultipartFile> questionImages,
    @Part() List<MultipartFile> answerImages,
  );

  @MultiPart()
  @POST('/images/profile')
  Future<HttpResponse<PostImagesProfileResponse>> postImagesProfile(
    @Part() List<MultipartFile> profileImage,
  );

  @POST('/questions')
  Future<HttpResponse<PostQuestionsResponse>> postQuestions(
    @Body() PostQuestionsRequest request,
  );

  @GET('/subjects')
  Future<HttpResponse<GetSubjectsResponse>> getSubjects();

  @GET('/users')
  Future<HttpResponse<StarUser>> getUsers();

  @PATCH('/users')
  Future<HttpResponse<StarUser>> patchUsers(@Body() PatchUsersRequest request);
}

@JsonSerializable()
class PatchUsersRequest {
  const PatchUsersRequest({
    this.profileImageUrl,
    this.nickName,
    this.comment,
  });

  factory PatchUsersRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchUsersRequestFromJson(json);

  final String? profileImageUrl;
  final String? nickName;
  final String? comment;

  Map<String, dynamic> toJson() => _$PatchUsersRequestToJson(this);
}

@JsonSerializable()
class StarUser {
  const StarUser({
    required this.id,
    required this.kakaoId,
    required this.email,
    this.profileUrl,
    required this.nickName,
    this.comment,
    required this.attendance,
    required this.lastConnectionDate,
    this.totalReviewTime,
  });

  factory StarUser.fromJson(Map<String, dynamic> json) =>
      _$StarUserFromJson(json);

  final String id;
  final int kakaoId;
  final String email;
  final String? profileUrl;
  final String nickName;
  final String? comment;
  final int attendance;
  final String lastConnectionDate;
  final int? totalReviewTime;

  Map<String, dynamic> toJson() => _$StarUserToJson(this);
}

@JsonSerializable()
class GetSubjectsResponse {
  const GetSubjectsResponse({
    required this.subjects,
  });

  factory GetSubjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSubjectsResponseFromJson(json);

  final List<Subject> subjects;

  Map<String, dynamic> toJson() => _$GetSubjectsResponseToJson(this);
}

@JsonSerializable()
class PostQuestionsResponse {
  const PostQuestionsResponse({
    required this.id,
    required this.subjectName,
    required this.title,
    required this.questionType,
    required this.difficultyType,
    required this.memo,
    required this.correctAnswers,
    required this.reason,
    required this.keywords,
    required this.questionImageUrls,
    required this.answerImageUrls,
    required this.questionCreatedAt,
    required this.questionModifiedAt,
    required this.answerCreatedAt,
    required this.answerModifiedAt,
  });

  factory PostQuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$PostQuestionsResponseFromJson(json);

  final String id;
  final String subjectName;
  final String title;
  final String questionType;
  final String difficultyType;
  final String memo;
  final List<String> correctAnswers;
  final String reason;
  final List<String> keywords;
  final List<String> questionImageUrls;
  final List<String> answerImageUrls;
  final String questionCreatedAt;
  final String questionModifiedAt;
  final String answerCreatedAt;
  final String answerModifiedAt;

  Map<String, dynamic> toJson() => _$PostQuestionsResponseToJson(this);
}

@JsonSerializable()
class PostQuestionsRequest {
  const PostQuestionsRequest({
    required this.subjectName,
    required this.title,
    required this.questionType,
    required this.difficultyType,
    this.memo,
    required this.correctAnswers,
    required this.incorrectReason,
    required this.keywords,
    required this.questionImageUrls,
    required this.answerImageUrls,
  });

  factory PostQuestionsRequest.fromJson(Map<String, dynamic> json) =>
      _$PostQuestionsRequestFromJson(json);

  final String subjectName;
  final String title;
  final String questionType;
  final String difficultyType;
  final String? memo;
  final List<String> correctAnswers;
  final String incorrectReason;
  final List<String> keywords;
  final List<String> questionImageUrls;
  final List<String> answerImageUrls;

  Map<String, dynamic> toJson() => _$PostQuestionsRequestToJson(this);
}

@JsonSerializable()
class PostImagesQuestionsResponse {
  const PostImagesQuestionsResponse({
    required this.questionImageUrls,
    required this.answerImageUrls,
    required this.profileUrl,
  });

  factory PostImagesQuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$PostImagesQuestionsResponseFromJson(json);

  final List<String> questionImageUrls;
  final List<String> answerImageUrls;
  final String profileUrl;

  Map<String, dynamic> toJson() => _$PostImagesQuestionsResponseToJson(this);
}

@JsonSerializable()
class PostImagesProfileResponse {
  const PostImagesProfileResponse({
    required this.profileImageUrl,
  });

  factory PostImagesProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$PostImagesProfileResponseFromJson(json);

  final String profileImageUrl;

  Map<String, dynamic> toJson() => _$PostImagesProfileResponseToJson(this);
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
