import 'package:bside_todolist/api/api.dart';
import 'package:dio/dio.dart';

RestClient getApiClient() {
  final dio = Dio(BaseOptions(
    baseUrl:
        'http://ec2-43-202-219-91.ap-northeast-2.compute.amazonaws.com:8080/api',
  ));

  final apiClient = RestClient(dio);
  return apiClient;
}
