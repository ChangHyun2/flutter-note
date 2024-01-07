import 'package:bside_todolist/api/api.dart';
import 'package:bside_todolist/api/apiClient.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.g.dart';

@riverpod
Future<StarUser?> user(ref) async {
  try {
    final response = await getApiClient().getUser();
    return response.data;
  } catch (e) {
    print(e);
    return null;
  }
}
