import 'package:bside_todolist/api/api.dart';
import 'package:bside_todolist/api/apiClient.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subjects.g.dart';

@riverpod
Future<List<Subject>?> subjects(ref) async {
  try {
    final response = await getApiClient().getSubjects();
    return response.data.subjects;
  } catch (e) {
    print(e);
    return null;
  }
}
