import 'package:bside_todolist/api/api.dart';
import 'package:bside_todolist/api/apiClient.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'questions_subjects_id.g.dart';

@riverpod
class QuestionsSubjectsIdRiver extends _$QuestionsSubjectsIdRiver {
  @override
  Future<List<Question>?> build(String id) async {
    try {
      final response = await getApiClient().getQuestionsSubjectsId(this.id);
      print('get questions subjects id done');
      return response.data.questions;
    } catch (e) {
      print('get questions error');
      print(e);
      return null;
    }
  }
}
