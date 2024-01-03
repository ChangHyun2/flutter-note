import 'package:bside_todolist/api/api.dart';
import 'package:dio/dio.dart';

RestClient getApiClient() {
  final dio = Dio();

  final apiClient = RestClient(dio);
  return apiClient;
}
