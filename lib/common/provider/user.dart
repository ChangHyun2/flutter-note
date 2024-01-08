import 'package:bside_todolist/api/api.dart';
import 'package:bside_todolist/api/apiClient.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.g.dart';

@riverpod
class UserRiver extends _$UserRiver {
  @override
  Future<StarUser?> build() async {
    try {
      final response = await getApiClient().getUser();
      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> postUser(PostUserRequest postUserRequest) async {
    try {
      final response = await getApiClient().postUser(postUserRequest);
      state = AsyncData(response.data);
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
