// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSubjectsResponse _$GetSubjectsResponseFromJson(Map<String, dynamic> json) =>
    GetSubjectsResponse(
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => Subject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetSubjectsResponseToJson(
        GetSubjectsResponse instance) =>
    <String, dynamic>{
      'subjects': instance.subjects,
    };

PostQuestionsResponse _$PostQuestionsResponseFromJson(
        Map<String, dynamic> json) =>
    PostQuestionsResponse(
      id: json['id'] as String,
      subjectName: json['subjectName'] as String,
      title: json['title'] as String,
      questionType: json['questionType'] as String,
      difficultyType: json['difficultyType'] as String,
      memo: json['memo'] as String,
      correctAnswers: (json['correctAnswers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      reason: json['reason'] as String,
      keywords:
          (json['keywords'] as List<dynamic>).map((e) => e as String).toList(),
      questionImageUrls: (json['questionImageUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      answerImageUrls: (json['answerImageUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      questionCreatedAt: json['questionCreatedAt'] as String,
      questionModifiedAt: json['questionModifiedAt'] as String,
      answerCreatedAt: json['answerCreatedAt'] as String,
      answerModifiedAt: json['answerModifiedAt'] as String,
    );

Map<String, dynamic> _$PostQuestionsResponseToJson(
        PostQuestionsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subjectName': instance.subjectName,
      'title': instance.title,
      'questionType': instance.questionType,
      'difficultyType': instance.difficultyType,
      'memo': instance.memo,
      'correctAnswers': instance.correctAnswers,
      'reason': instance.reason,
      'keywords': instance.keywords,
      'questionImageUrls': instance.questionImageUrls,
      'answerImageUrls': instance.answerImageUrls,
      'questionCreatedAt': instance.questionCreatedAt,
      'questionModifiedAt': instance.questionModifiedAt,
      'answerCreatedAt': instance.answerCreatedAt,
      'answerModifiedAt': instance.answerModifiedAt,
    };

PostQuestionsRequest _$PostQuestionsRequestFromJson(
        Map<String, dynamic> json) =>
    PostQuestionsRequest(
      subjectName: json['subjectName'] as String,
      title: json['title'] as String,
      questionType: json['questionType'] as String,
      difficultyType: json['difficultyType'] as String,
      memo: json['memo'] as String,
      correctAnswers: (json['correctAnswers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      incorrectReason: json['incorrectReason'] as String,
      keywords:
          (json['keywords'] as List<dynamic>).map((e) => e as String).toList(),
      questionImageUrls: (json['questionImageUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      answerImageUrls: (json['answerImageUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PostQuestionsRequestToJson(
        PostQuestionsRequest instance) =>
    <String, dynamic>{
      'subjectName': instance.subjectName,
      'title': instance.title,
      'questionType': instance.questionType,
      'difficultyType': instance.difficultyType,
      'memo': instance.memo,
      'correctAnswers': instance.correctAnswers,
      'incorrectReason': instance.incorrectReason,
      'keywords': instance.keywords,
      'questionImageUrls': instance.questionImageUrls,
      'answerImageUrls': instance.answerImageUrls,
    };

PostImagesResponse _$PostImagesResponseFromJson(Map<String, dynamic> json) =>
    PostImagesResponse(
      questionImageUrls: (json['questionImageUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      answerImageUrls: (json['answerImageUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      profileUrl: json['profileUrl'] as String,
    );

Map<String, dynamic> _$PostImagesResponseToJson(PostImagesResponse instance) =>
    <String, dynamic>{
      'questionImageUrls': instance.questionImageUrls,
      'answerImageUrls': instance.answerImageUrls,
      'profileUrl': instance.profileUrl,
    };

PostAuthKakaoRequest _$PostAuthKakaoRequestFromJson(
        Map<String, dynamic> json) =>
    PostAuthKakaoRequest(
      id: json['id'] as int,
      email: json['email'] as String,
      nickname: json['nickname'] as String,
      profileUrl: json['profileUrl'] as String,
    );

Map<String, dynamic> _$PostAuthKakaoRequestToJson(
        PostAuthKakaoRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'nickname': instance.nickname,
      'profileUrl': instance.profileUrl,
    };

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
    };

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
      subjectId: json['subjectId'] as String,
      subjectName: json['subjectName'] as String,
      subjectSize: json['subjectSize'] as int,
      createdAt: json['createdAt'] as String,
      modifiedAt: json['modifiedAt'] as String,
    );

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'subjectId': instance.subjectId,
      'subjectName': instance.subjectName,
      'subjectSize': instance.subjectSize,
      'createdAt': instance.createdAt,
      'modifiedAt': instance.modifiedAt,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://3.36.89.204:8080/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<Token>> postAuthKakao(
      PostAuthKakaoRequest request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<Token>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/auth/kakao',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Token.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<PostImagesResponse>> postImages(
    List<MultipartFile> questionImages,
    List<MultipartFile> answerImages,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files
        .addAll(questionImages.map((i) => MapEntry('questionImages', i)));
    _data.files.addAll(answerImages.map((i) => MapEntry('answerImages', i)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<PostImagesResponse>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/images/questions',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = PostImagesResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<PostQuestionsResponse>> postQuestions(
      PostQuestionsRequest request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<PostQuestionsResponse>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/questions',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = PostQuestionsResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GetSubjectsResponse>> getSubjects() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<GetSubjectsResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/subjects',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GetSubjectsResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
