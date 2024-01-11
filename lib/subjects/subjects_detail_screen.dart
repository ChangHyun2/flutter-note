import 'package:bside_todolist/common/provider/questions_subjects_id.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class SubjectsDetailScreen extends ConsumerWidget {
  final String subjectId;

  const SubjectsDetailScreen({super.key, required this.subjectId});

  @override
  Widget build(BuildContext context, ref) {
    var questions = ref.watch(questionsSubjectsIdRiverProvider(subjectId));

    if (questions.isLoading) {
      return Text('loading');
    }

    if (questions.hasError) {
      return Text('error');
    }

    if (questions.hasValue) {
      if (questions.value == null) return Text('');
      var questionsValue = questions.value!;

      return Column(
        children: questionsValue
            .map(
              (question) => Text(question.title),
            )
            .toList(),
      );
    }

    return Text('');
  }
}
