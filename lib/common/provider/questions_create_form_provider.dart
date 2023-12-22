// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:bside_todolist/api/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QuestionsCreateFormProvider extends ChangeNotifier {
  List<String> questionImages = [];
  List<String> questionImageUrls = [];
  List<String> answerImages = [];
  List<String> answerImageUrls = [];
  String? incorrectReason;
  String? correctAnswer;
  String? memo;
  String? difficultyType;
  String? questionType;
  String? title;
  String? subjectName;
}
