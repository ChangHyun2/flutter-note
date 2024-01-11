import 'package:bside_todolist/api/api.dart';
import 'package:bside_todolist/api/apiClient.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.g.dart';

@riverpod
class UserRiver extends _$UserRiver {
  @override
  Future<StarUser?> build() async {
    try {
      final response = await getApiClient().getUsers();
      print('get users done');
      print(response.data);
      return response.data;
    } catch (e) {
      print('get users error');
      print(e);
      return null;
    }
  }

  Future<void> patchUsers(PatchUsersRequest patchUserRequest) async {
    try {
      final response = await getApiClient().patchUsers(patchUserRequest);

      state = AsyncData(response.data);
    } catch (e) {
      print('patch users error');
      print(e);
      throw e;
    }
  }
}
