import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:bside_todolist/quiz/widget/quiz_create_modal.dart';
import 'package:bside_todolist/quiz/widget/quiz_delete_modal.dart';
import 'package:bside_todolist/quiz/widget/quiz_rename_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizModal extends StatelessWidget {
  const QuizModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double listItemHeight = 74; // 각각의 ListTile의 높이

    return Container(
      height: 3 * listItemHeight + 48, // 3등분된 높이와 간격 고려
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12,
                ),
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.5),
                    color: const Color(0xFF000000).withOpacity(0.10),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 3 * listItemHeight,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Center(
                          child: SizedBox(
                            height: listItemHeight,
                            child: Container(
                              child: const Center(
                                child: Text(
                                  '폴더 전체 풀기',
                                  style: MyTexts.KR17700,
                                  textAlign: TextAlign.center, // 텍스트를 수직 중앙에 정렬
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const QuizRenameModal();
                            },
                          );
                        },
                        child: Center(
                          child: SizedBox(
                            height: listItemHeight,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xffC6C6C8), // 테두리 색상
                                  width: 0.5, // 테두리 두께
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  '폴더명 변경',
                                  style: MyTexts.KR17700,
                                  textAlign: TextAlign.center, // 텍스트를 수직 중앙에 정렬
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const QuizDeleteModal();
                            },
                          );
                        },
                        child: Center(
                          child: SizedBox(
                            height: listItemHeight,
                            child: Container(
                              child: Center(
                                child: Text(
                                  '폴더 삭제',
                                  style: MyTexts.KR17700
                                      .copyWith(color: Colors.red),
                                  textAlign: TextAlign.center, // 텍스트를 수직 중앙에 정렬
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
