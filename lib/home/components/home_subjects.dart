import 'package:bside_todolist/api/api.dart';
import 'package:bside_todolist/api/apiClient.dart';
import 'package:bside_todolist/common/components/ui/card_wrapper.dart';
import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:flutter/material.dart';

import '../../common/components/ui/system/colors.dart';

class HomeSubjects extends StatelessWidget {
  const HomeSubjects({super.key});

  @override
  Widget build(BuildContext context) {
    final mockSubjects = [
      const Subject(
          subjectId: 'abc',
          subjectName: '전체 폴더',
          subjectSize: 23123,
          createdAt: '123',
          modifiedAt: 'asdf'),
      const Subject(
          subjectId: 'ab',
          subjectName: '수학',
          subjectSize: 100,
          createdAt: '123',
          modifiedAt: 'asdf'),
      const Subject(
          subjectId: 'abcd',
          subjectName: '영어',
          subjectSize: 23,
          createdAt: '123',
          modifiedAt: 'asdf')
    ];

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('오답노트 ️🗂', style: MyTexts.KRBold17),
              Text('전체보기',
                  style: MyTexts.KRRegular14.copyWith(
                    color: MyColors.contentsSub,
                  ))
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 112,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FutureBuilder(
              future: getApiClient().getSubjects(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('');
                } else if (snapshot.hasError) {
                  return const Text('');
                } else {
                  List<Subject> subjects = snapshot.data!.data.subjects;

                  return ListView.separated(
                    itemCount: subjects.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(width: 16),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return CardWrapper(
                        borderRadius: 5,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          width: 150,
                          height: 112,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                subjects[index].subjectName,
                                style: MyTexts.KR16700,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    subjects[index].subjectSize.toString(),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
        )
      ],
    );
  }
}
