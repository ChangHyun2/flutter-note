import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:bside_todolist/quiz/widget/quiz_create_modal.dart';
import 'package:bside_todolist/quiz/widget/quiz_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<String> folders = ['전체문제', 'English', '확률과 통계', '23년 8월 모의고사'];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
              width: double.infinity,
              child: const Text(
                '오답노트',
                style: MyTexts.KR24800,
              )),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const TextField(
                  decoration: InputDecoration(
                      hintText: '문제를 검색해보세요',
                      prefixIcon: Icon(Icons.search),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      )))),
          const SizedBox(
            height: 48,
          ),
          Container(
            child: Stack(children: _buildFolderStack()),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFolderStack() {
    List<Widget> folderStack = [];

    for (int i = 0; i < folders.length; i++) {
      folderStack.add(
        Positioned(
          top: i == 0 ? null : i * 104,
          child: Stack(
            children: [
              SvgPicture.asset('assets/icons/folder${i % 4}.svg'),
              Positioned(
                top: 20,
                left: 16,
                child: Text(
                  folders[i],
                  style: MyTexts.KR24800,
                ),
              ),
              Positioned(
                top: 20,
                left: 16,
                child: Text(
                  folders[i],
                  style: MyTexts.KR24800,
                ),
              ),
              Positioned(
                top: 54,
                left: 330,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      //elevation: 0.0,
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (BuildContext context) {
                        return const QuizModal();
                      },
                    );
                  },
                  child: SvgPicture.asset('assets/icons/threeDot.svg'),
                ),
              ),
            ],
          ),
        ),
      );
    }

    //플러스 아이콘 추가
    folderStack.add(
      Positioned(
        top: folders.length * 104.0,
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const QuizCreateModal();
              },
            );
          },
          child: Stack(
            children: [
              SvgPicture.asset('assets/icons/folder4.svg'),
              const Positioned(
                top: 20,
                left: 16,
                child: Row(
                  children: [
                    Text(
                      '폴더추가',
                      style: MyTexts.KR24800,
                    ),
                    SizedBox(width: 143),
                    Icon(Icons.add, size: 24.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // ),
    );

    return folderStack;
  } // 새로운 폴더를 추가하는 메서드

  void _addFolder() {
    setState(() {
      int newFolderNumber = folders.length + 1;
      folders.add('폴더$newFolderNumber');
    });
  }
}
