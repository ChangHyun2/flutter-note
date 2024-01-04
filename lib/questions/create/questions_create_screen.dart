import 'dart:io';
import 'package:bside_todolist/common/components/document_scanner.dart';
import 'package:bside_todolist/common/components/ui/button.dart';
import 'package:bside_todolist/common/components/ui/card_wrapper.dart';
import 'package:bside_todolist/common/components/ui/system/box_shadow.dart';
import 'package:bside_todolist/common/components/ui/system/colors.dart';
import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class QuestionsCreateScreen extends StatefulWidget {
  const QuestionsCreateScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsCreateScreen> createState() => _QuestionsCreateScreenState();
}

class _QuestionsCreateScreenState extends State<QuestionsCreateScreen> {
  List<String> _problemPictures = [];
  List<String> _keywords = [];
  var _titleController = TextEditingController();
  var _answerController = TextEditingController();
  var _memoController = TextEditingController();
  var _keywordController = TextEditingController();
  var _questionType = 0;
  var _incorrectReason = 0;
  var _difficultType = 0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {}

  @override
  Widget build(BuildContext context) {
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    bool isKeyboardOpened = bottom > 0;

    return SafeArea(
      child: KeyboardDismissOnTap(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: MyColors.starGreen,
            leading: IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: () {
                context.pop();
              },
            ),
            title: Text('문제 등록'),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            DocumentScanner(title: '문제를 등록해 보세요', height: 360),
                            const SizedBox(height: 24),
                            const Text('문제 정보', style: MyTexts.KR17700),
                            const SizedBox(height: 24),
                            Row(children: [
                              const Text('문제 제목', style: MyTexts.KR14700),
                              Text(
                                '*',
                                style: MyTexts.KR14700
                                    .copyWith(color: MyColors.red400),
                              ),
                            ]),
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child: TextFormField(
                                controller: _titleController,
                                decoration: InputDecoration(
                                  hintText: '예: 8월모의고사/수학',
                                  border: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: MyColors.starGreen),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: MyColors.starGreen),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: MyColors.starGreen),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: _titleController.clear,
                                    icon: const Icon(
                                      Icons.clear_rounded,
                                      color: MyColors.starGreen,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            Row(children: [
                              const Text('문제 유형', style: MyTexts.KR14700),
                              Text(
                                '*',
                                style: MyTexts.KR14700
                                    .copyWith(color: MyColors.red400),
                              ),
                            ]),
                            Row(
                              children: [
                                const SizedBox(width: 8),
                                Text('주관식', style: MyTexts.KR14400),
                                Radio(
                                  value: 0,
                                  groupValue: _questionType,
                                  onChanged: (value) {
                                    if (value != null) {
                                      setState(() {
                                        _questionType = value;
                                      });
                                    }
                                  },
                                  fillColor: MaterialStateProperty.resolveWith(
                                      (states) => _questionType == 0
                                          ? MyColors.starGreen
                                          : MyColors.gray500),
                                ),
                                Text('객관식', style: MyTexts.KR14400),
                                Radio(
                                  value: 1,
                                  groupValue: _questionType,
                                  onChanged: (value) {
                                    if (value != null) {
                                      setState(() {
                                        _questionType = value;
                                      });
                                    }
                                  },
                                  fillColor: MaterialStateProperty.resolveWith(
                                      (states) => _questionType == 1
                                          ? MyColors.starGreen
                                          : MyColors.gray500),
                                ),
                              ],
                            ),
                            const SizedBox(height: 28),
                            Row(children: [
                              const Text('정답', style: MyTexts.KR14700),
                              Text(
                                '*',
                                style: MyTexts.KR14700
                                    .copyWith(color: MyColors.red400),
                              ),
                            ]),
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child: TextFormField(
                                controller: _answerController,
                                decoration: InputDecoration(
                                  hintText: '주관식 답을 입력해주세요',
                                  border: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: MyColors.starGreen),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: MyColors.starGreen),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: MyColors.starGreen),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: _answerController.clear,
                                    icon: const Icon(
                                      Icons.clear_rounded,
                                      color: MyColors.starGreen,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            const Text('오답 정보', style: MyTexts.KR17700),
                            const SizedBox(height: 24),
                            const Text('틀린 이유', style: MyTexts.KR14700),
                            Row(
                              children: [
                                SizedBox(width: 8),
                                Text('개념 이해 부족', style: MyTexts.KR14400),
                                Checkbox(
                                  value: _difficultType == 0,
                                  onChanged: (value) {
                                    if (value == true) {
                                      setState(() {
                                        _difficultType = 0;
                                      });
                                    }
                                  },
                                  fillColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  checkColor: MyColors.starGreen,
                                  side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(
                                      color: states
                                              .contains(MaterialState.selected)
                                          ? MyColors.starGreen
                                          : MyColors.gray500,
                                      width: 1.5,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                ),
                                Text('시간 관리 부족', style: MyTexts.KR14400),
                                Checkbox(
                                  value: _difficultType == 1,
                                  onChanged: (value) {
                                    if (value == true) {
                                      setState(() {
                                        _difficultType = 1;
                                      });
                                    }
                                  },
                                  fillColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  checkColor: MyColors.starGreen,
                                  side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(
                                      color: states
                                              .contains(MaterialState.selected)
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
                                SizedBox(width: 8),
                                Text('문제 해독 미숙', style: MyTexts.KR14400),
                                Checkbox(
                                  value: _difficultType == 2,
                                  onChanged: (value) {
                                    if (value == true) {
                                      setState(() {
                                        _difficultType = 2;
                                      });
                                    }
                                  },
                                  fillColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  checkColor: MyColors.starGreen,
                                  side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(
                                      color: states
                                              .contains(MaterialState.selected)
                                          ? MyColors.starGreen
                                          : MyColors.gray500,
                                      width: 1.5,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                ),
                                Text('단순 실수', style: MyTexts.KR14400),
                                Checkbox(
                                  value: _difficultType == 3,
                                  onChanged: (value) {
                                    if (value == true) {
                                      setState(() {
                                        _difficultType = 3;
                                      });
                                    }
                                  },
                                  fillColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  checkColor: MyColors.starGreen,
                                  side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(
                                      color: states
                                              .contains(MaterialState.selected)
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
                            const SizedBox(height: 28),
                            const Text('문제 난이도', style: MyTexts.KR14700),
                            Row(
                              children: [
                                SizedBox(width: 8),
                                Text('어려움', style: MyTexts.KR14400),
                                Checkbox(
                                  value: _incorrectReason == 0,
                                  onChanged: (value) {
                                    if (value == true) {
                                      setState(() {
                                        _incorrectReason = 0;
                                      });
                                    }
                                  },
                                  fillColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  checkColor: MyColors.starGreen,
                                  side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(
                                      color: states
                                              .contains(MaterialState.selected)
                                          ? MyColors.starGreen
                                          : MyColors.gray500,
                                      width: 1.5,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                ),
                                Text('보통', style: MyTexts.KR14400),
                                Checkbox(
                                  value: _incorrectReason == 1,
                                  onChanged: (value) {
                                    if (value == true) {
                                      setState(() {
                                        _incorrectReason = 1;
                                      });
                                    }
                                  },
                                  fillColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  checkColor: MyColors.starGreen,
                                  side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(
                                      color: states
                                              .contains(MaterialState.selected)
                                          ? MyColors.starGreen
                                          : MyColors.gray500,
                                      width: 1.5,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                ),
                                Text('쉬움', style: MyTexts.KR14400),
                                Checkbox(
                                  value: _incorrectReason == 2,
                                  onChanged: (value) {
                                    if (value == true) {
                                      setState(() {
                                        _incorrectReason = 2;
                                      });
                                    }
                                  },
                                  fillColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  checkColor: MyColors.starGreen,
                                  side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(
                                      color: states
                                              .contains(MaterialState.selected)
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
                            const SizedBox(height: 28),
                            const Text('해설 등록', style: MyTexts.KR14700),
                            const SizedBox(height: 16),
                            DocumentScanner(title: '해설을 등록해 보세요', height: 140),
                            const SizedBox(height: 24),
                            const Text('메모', style: MyTexts.KR14700),
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child: TextFormField(
                                controller: _memoController,
                                decoration: InputDecoration(
                                  hintText: '오답 분석에 필요한 내용을 적어보세요',
                                  border: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: MyColors.starGreen),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: MyColors.starGreen),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: MyColors.starGreen),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: _memoController.clear,
                                    icon: const Icon(
                                      Icons.clear_rounded,
                                      color: MyColors.starGreen,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            const Text('키워드', style: MyTexts.KR14700),
                            SizedBox(height: _keywords.isEmpty ? 0 : 16),
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: _keywords
                                          .map(
                                            (keyword) => CardWrapper(
                                              borderRadius: 100,
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    16, 0, 8, 0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      keyword,
                                                      style: MyTexts.KR14400
                                                          .copyWith(
                                                        color:
                                                            MyColors.starGreen,
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _keywords = _keywords
                                                              .where(
                                                                  (_keyword) =>
                                                                      _keyword !=
                                                                      keyword)
                                                              .toList();
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 24,
                                                        height: 24,
                                                        child: Center(
                                                          child: Icon(
                                                            Icons.clear,
                                                            size: 16,
                                                            color: MyColors
                                                                .gray500,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _keywordController,
                                    onEditingComplete: () {
                                      setState(() {
                                        _keywords = [
                                          ..._keywords,
                                          _keywordController.value.text
                                        ].toSet().toList();
                                        _keywordController.clear();
                                      });
                                      print('editing complete');
                                    },
                                    decoration: InputDecoration(
                                      hintText: '키워드를 등록해보세요',
                                      border: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: MyColors.starGreen),
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: MyColors.starGreen),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: MyColors.starGreen),
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: _keywordController.clear,
                                        icon: const Icon(
                                          Icons.clear_rounded,
                                          color: MyColors.starGreen,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 22),
                            Row(children: [
                              const Text('폴더 선택', style: MyTexts.KR14700),
                              Text(
                                '*',
                                style: MyTexts.KR14700
                                    .copyWith(color: MyColors.red400),
                              ),
                            ]),
                            SizedBox(height: 16),
                            Container(
                              child: DropdownMenu(
                                width: MediaQuery.of(context).size.width - 32,
                                initialSelection: 1,
                                dropdownMenuEntries: [
                                  DropdownMenuEntry(
                                    value: 1,
                                    label: '폴더1',
                                  ),
                                  DropdownMenuEntry(value: 2, label: '폴더2'),
                                  DropdownMenuEntry(value: 3, label: '폴더3')
                                ],
                              ),
                            ),
                            SizedBox(height: 40),
                            const SizedBox(height: 64),
                          ],
                        ),
                      ),
                      KeyboardVisibilityBuilder(builder: (context, visible) {
                        if (visible) {
                          return Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              boxShadow: [MyBoxShadows.bottomShadow],
                            ),
                            height: 64,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 35, vertical: 11),
                            child: MyButton(
                              onPressed: () {},
                              type: MyButtonType.starGreen,
                              child: Text('문제와 해설 등록하기'),
                            ),
                          );
                        }

                        return Text('');
                      }),
                    ],
                  ),
                ),
              ),
              MediaQuery.of(context).viewInsets.bottom == 0
                  ? Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          boxShadow: [MyBoxShadows.bottomShadow],
                        ),
                        height: 64,
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 35, vertical: 11),
                        child: MyButton(
                          onPressed: () {},
                          type: MyButtonType.starGreen,
                          child: Text('문제와 해설 등록하기'),
                        ),
                      ),
                    )
                  : Text(''),
            ],
          ),
          bottomNavigationBar: null,
        ),
      ),
    );
  }

  void onPressed() async {
    List<String> pictures;
    try {
      print('start');
      pictures = await CunningDocumentScanner.getPictures(true) ?? [];
      print('end');
      if (!mounted) return;
      setState(() {
        _problemPictures = pictures;
      });
    } catch (exception) {
      print(exception);
      // Handle exception here
    }
  }
}
