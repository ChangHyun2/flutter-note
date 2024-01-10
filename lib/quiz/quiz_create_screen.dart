import 'dart:ffi';

import 'package:bside_todolist/common/components/ui/button.dart';
import 'package:bside_todolist/common/components/ui/system/colors.dart';
import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:flutter/material.dart';

class QuizCreateScreen extends StatefulWidget {
  const QuizCreateScreen({Key? key}) : super(key: key);

  @override
  State<QuizCreateScreen> createState() => _QuizCreateScreenState();
}

class _QuizCreateScreenState extends State<QuizCreateScreen> {
  final List<bool> _questionTypes = [false, false]; // 주관식, 객관식
  final List<bool> _difficultyLevels = [false, false, false]; // 어려움, 보통, 쉬움
  final List<bool> _incorrectReasons = [
    false,
    false,
    false,
    false
  ]; //개면, 시간, 문제, 단순

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 39,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: RichText(
              text: const TextSpan(
                text: '폴더를 선택해주세요(복수선택 가능)',
                style: MyTexts.KR16800,
                children: [
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      color: Colors.red, // 빨간색으로 변경
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            child: DropdownMenu(
              width: MediaQuery.of(context).size.width - 32,
              initialSelection: 1,
              dropdownMenuEntries: const [
                DropdownMenuEntry(
                  value: 1,
                  label: '폴더1',
                ),
                DropdownMenuEntry(value: 2, label: '폴더2'),
                DropdownMenuEntry(value: 3, label: '폴더3')
              ],
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '퀴즈의 조건을 선택해보세요',
                    style: MyTexts.KR16800,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    '문제 유형(복수선택 가능)',
                    style: MyTexts.KR14700,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      const Text('주관식', style: MyTexts.KR14400),
                      Checkbox(
                        value: _questionTypes[0],
                        onChanged: (value) {
                          setState(() {
                            _questionTypes[0] = value ?? false;
                          });
                        },
                        fillColor:
                            MaterialStateProperty.all(Colors.transparent),
                        checkColor: MyColors.starGreen,
                        side: MaterialStateBorderSide.resolveWith(
                          (states) => BorderSide(
                            color: states.contains(MaterialState.selected)
                                ? MyColors.starGreen
                                : MyColors.gray500,
                            width: 1.5,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                      ),
                      const SizedBox(
                        width: 34,
                      ),
                      const Text('객관식', style: MyTexts.KR14400),
                      Checkbox(
                        value: _questionTypes[1],
                        onChanged: (value) {
                          setState(() {
                            _questionTypes[1] = value ?? false;
                          });
                        },
                        fillColor:
                            MaterialStateProperty.all(Colors.transparent),
                        checkColor: MyColors.starGreen,
                        side: MaterialStateBorderSide.resolveWith(
                          (states) => BorderSide(
                            color: states.contains(MaterialState.selected)
                                ? MyColors.starGreen
                                : MyColors.gray500,
                            width: 1.5,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('문제 난이도(복수선택 가능)', style: MyTexts.KR14700),
                    Row(
                      children: [
                        const SizedBox(width: 8),
                        const Text('어려움', style: MyTexts.KR14400),
                        Checkbox(
                          value: _difficultyLevels[0],
                          onChanged: (value) {
                            setState(() {
                              _difficultyLevels[0] = value ?? false;
                            });
                          },
                          fillColor:
                              MaterialStateProperty.all(Colors.transparent),
                          checkColor: MyColors.starGreen,
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(
                              color: states.contains(MaterialState.selected)
                                  ? MyColors.starGreen
                                  : MyColors.gray500,
                              width: 1.5,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                        const SizedBox(
                          width: 34,
                        ),
                        const Text('보통', style: MyTexts.KR14400),
                        Checkbox(
                          value: _difficultyLevels[1],
                          onChanged: (value) {
                            setState(() {
                              _difficultyLevels[1] = value ?? false;
                            });
                          },
                          fillColor:
                              MaterialStateProperty.all(Colors.transparent),
                          checkColor: MyColors.starGreen,
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(
                              color: states.contains(MaterialState.selected)
                                  ? MyColors.starGreen
                                  : MyColors.gray500,
                              width: 1.5,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                        const SizedBox(
                          width: 34,
                        ),
                        const Text('쉬움', style: MyTexts.KR14400),
                        Checkbox(
                          value: _difficultyLevels[2],
                          onChanged: (value) {
                            setState(() {
                              _difficultyLevels[2] = value ?? false;
                            });
                          },
                          fillColor:
                              MaterialStateProperty.all(Colors.transparent),
                          checkColor: MyColors.starGreen,
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(
                              color: states.contains(MaterialState.selected)
                                  ? MyColors.starGreen
                                  : MyColors.gray500,
                              width: 1.5,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                      ],
                    ),
                  ])),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('틀린 이유(복수선택 가능)', style: MyTexts.KR14700),
                    Row(
                      children: [
                        const SizedBox(width: 8),
                        const Text('개념 이해 부족', style: MyTexts.KR14400),
                        Checkbox(
                          value: _incorrectReasons[0],
                          onChanged: (value) {
                            setState(() {
                              _incorrectReasons[0] = value ?? false;
                            });
                          },
                          fillColor:
                              MaterialStateProperty.all(Colors.transparent),
                          checkColor: MyColors.starGreen,
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(
                              color: states.contains(MaterialState.selected)
                                  ? MyColors.starGreen
                                  : MyColors.gray500,
                              width: 1.5,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                        const SizedBox(
                          width: 34,
                        ),
                        const Text('시간 관리 부족', style: MyTexts.KR14400),
                        Checkbox(
                          value: _incorrectReasons[1],
                          onChanged: (value) {
                            setState(() {
                              _incorrectReasons[1] = value ?? false;
                            });
                          },
                          fillColor:
                              MaterialStateProperty.all(Colors.transparent),
                          checkColor: MyColors.starGreen,
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(
                              color: states.contains(MaterialState.selected)
                                  ? MyColors.starGreen
                                  : MyColors.gray500,
                              width: 1.5,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 8),
                        const Text('문제 해독 미숙', style: MyTexts.KR14400),
                        Checkbox(
                          value: _incorrectReasons[2],
                          onChanged: (value) {
                            setState(() {
                              _incorrectReasons[2] = value ?? false;
                            });
                          },
                          fillColor:
                              MaterialStateProperty.all(Colors.transparent),
                          checkColor: MyColors.starGreen,
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(
                              color: states.contains(MaterialState.selected)
                                  ? MyColors.starGreen
                                  : MyColors.gray500,
                              width: 1.5,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                        const SizedBox(
                          width: 34,
                        ),
                        const Text('단순 실수', style: MyTexts.KR14400),
                        Checkbox(
                          value: _incorrectReasons[3],
                          onChanged: (value) {
                            setState(() {
                              _incorrectReasons[3] = value ?? false;
                            });
                          },
                          fillColor:
                              MaterialStateProperty.all(Colors.transparent),
                          checkColor: MyColors.starGreen,
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(
                              color: states.contains(MaterialState.selected)
                                  ? MyColors.starGreen
                                  : MyColors.gray500,
                              width: 1.5,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                      ],
                    ),
                  ])),
          const SizedBox(height: 163),
          SizedBox(
            width: 306, // 또는 다른 원하는 너비 값으로 조정
            height: 42,
            child: MyButton(
              onPressed: () {},
              type: MyButtonType.starGreen,
              child: const Text('나만의 퀴즈 풀기'),
            ),
          ),
        ],
      ),
    );
  }
}
