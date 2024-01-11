// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchUsersRequest _$PatchUsersRequestFromJson(Map<String, dynamic> json) =>
    PatchUsersRequest(
      profileUrl: json['profileUrl'] as String?,
      nickName: json['nickName'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$PatchUsersRequestToJson(PatchUsersRequest instance) =>
    <String, dynamic>{
      'profileUrl': instance.profileUrl,
      'nickName': instance.nickName,
      'comment': instance.comment,
    };

StarUser _$StarUserFromJson(Map<String, dynamic> json) => StarUser(
      id: json['id'] as String,
      kakaoId: json['kakaoId'] as int,
      email: json['email'] as String,
      profileUrl: json['profileUrl'] as String?,
      nickName: json['nickName'] as String,
      comment: json['comment'] as String?,
      attendance: json['attendance'] as int,
      lastConnectionDate: json['lastConnectionDate'] as String,
      totalReviewTime: json['totalReviewTime'] as int?,
    );

Map<String, dynamic> _$StarUserToJson(StarUser instance) => <String, dynamic>{
      'id': instance.id,
      'kakaoId': instance.kakaoId,
      'email': instance.email,
      'profileUrl': instance.profileUrl,
      'nickName': instance.nickName,
      'comment': instance.comment,
      'attendance': instance.attendance,
      'lastConnectionDate': instance.lastConnectionDate,
      'totalReviewTime': instance.totalReviewTime,
    };

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
      memo: json['memo'] as String?,
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

PostImagesQuestionsResponse _$PostImagesQuestionsResponseFromJson(
        Map<String, dynamic> json) =>
    PostImagesQuestionsResponse(
      questionImageUrls: (json['questionImageUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      answerImageUrls: (json['answerImageUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PostImagesQuestionsResponseToJson(
        PostImagesQuestionsResponse instance) =>
    <String, dynamic>{
      'questionImageUrls': instance.questionImageUrls,
      'answerImageUrls': instance.answerImageUrls,
    };

PostImagesProfileResponse _$PostImagesProfileResponseFromJson(
        Map<String, dynamic> json) =>
    PostImagesProfileResponse(
      profileImageUrl: json['profileImageUrl'] as String,
    );

Map<String, dynamic> _$PostImagesProfileResponseToJson(
        PostImagesProfileResponse instance) =>
    <String, dynamic>{
      'profileImageUrl': instance.profileImageUrl,
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

CreateQuizRequest _$CreateQuizRequestFromJson(Map<String, dynamic> json) =>
    CreateQuizRequest(
      subjectName: json['subjectName'] as String,
      questionType: (json['questionType'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      difficultyType: (json['difficultyType'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      incorrectReason: (json['incorrectReason'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CreateQuizRequestToJson(CreateQuizRequest instance) =>
    <String, dynamic>{
      'subjectName': instance.subjectName,
      'questionType': instance.questionType,
      'difficultyType': instance.difficultyType,
      'incorrectReason': instance.incorrectReason,
    };

CreateQuizResponse _$CreateQuizResponseFromJson(Map<String, dynamic> json) =>
    CreateQuizResponse(
      quizId: json['quizId'] as String,
      quizCreatedAt: json['quizCreatedAt'] as String,
      quizModifiedAt: json['quizModifiedAt'] as String,
    );

Map<String, dynamic> _$CreateQuizResponseToJson(CreateQuizResponse instance) =>
    <String, dynamic>{
      'quizId': instance.quizId,
      'quizCreatedAt': instance.quizCreatedAt,
      'quizModifiedAt': instance.quizModifiedAt,
    };

GetQuestionsSubjectsIdResponse _$GetQuestionsSubjectsIdResponseFromJson(
        Map<String, dynamic> json) =>
    GetQuestionsSubjectsIdResponse(
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetQuestionsSubjectsIdResponseToJson(
        GetQuestionsSubjectsIdResponse instance) =>
    <String, dynamic>{
      'questions': instance.questions,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: json['id'] as String,
      title: json['title'] as String,
      questionType: json['questionType'] as String,
      difficultyType: json['difficultyType'] as String,
      memo: json['memo'] as String,
      incorrectReason: json['incorrectReason'] as String,
      correctAnswers: (json['correctAnswers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
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

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'questionType': instance.questionType,
      'difficultyType': instance.difficultyType,
      'memo': instance.memo,
      'incorrectReason': instance.incorrectReason,
      'correctAnswers': instance.correctAnswers,
      'keywords': instance.keywords,
      'questionImageUrls': instance.questionImageUrls,
      'answerImageUrls': instance.answerImageUrls,
      'questionCreatedAt': instance.questionCreatedAt,
      'questionModifiedAt': instance.questionModifiedAt,
      'answerCreatedAt': instance.answerCreatedAt,
      'answerModifiedAt': instance.answerModifiedAt,
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
  Future<HttpResponse<PostImagesQuestionsResponse>> postImagesQuestions(
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
        _setStreamType<HttpResponse<PostImagesQuestionsResponse>>(Options(
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
    final value = PostImagesQuestionsResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<PostImagesProfileResponse>> postImagesProfile(
      List<MultipartFile> profileImage) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.addAll(profileImage.map((i) => MapEntry('profileImage', i)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<PostImagesProfileResponse>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/images/profile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = PostImagesProfileResponse.fromJson(_result.data!);
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
  Future<HttpResponse<GetQuestionsSubjectsIdResponse>> getQuestionsSubjectsId(
      String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<GetQuestionsSubjectsIdResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/questions/subjects/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GetQuestionsSubjectsIdResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CreateQuizResponse>> createQuiz(
      CreateQuizRequest request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CreateQuizResponse>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/quizzes',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = CreateQuizResponse.fromJson(_result.data!);
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

  @override
  Future<HttpResponse<StarUser>> getUsers() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<StarUser>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/users',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = StarUser.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<StarUser>> patchUsers(PatchUsersRequest request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<StarUser>>(Options(
      method: 'PATCH',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/users',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = StarUser.fromJson(_result.data!);
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
