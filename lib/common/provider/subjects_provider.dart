// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:bside_todolist/api/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SubjectsProvider extends ChangeNotifier {
  List<Subject> subjects = [];

  var fetchSubjects = () async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      Subject(
        subjectId: '0',
        subjectName: 'root',
        subjectSize: 0,
        createdAt: '123',
        modifiedAt: '123',
      ),
      Subject(
        subjectId: '1',
        subjectName: 'root1',
        subjectSize: 0,
        createdAt: '123',
        modifiedAt: '123',
      ),
      Subject(
        subjectId: '2',
        subjectName: 'root2',
        subjectSize: 0,
        createdAt: '123',
        modifiedAt: '123',
      ),
      Subject(
        subjectId: '3',
        subjectName: 'root3',
        subjectSize: 0,
        createdAt: '123',
        modifiedAt: '123',
      )
    ];
  };

  var addSubject = () async {};
}
