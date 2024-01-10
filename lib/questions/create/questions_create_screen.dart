import 'dart:io';
import 'package:bside_todolist/api/api.dart';
import 'package:bside_todolist/api/apiClient.dart';
import 'package:bside_todolist/common/components/ui/button.dart';
import 'package:bside_todolist/common/components/ui/card_wrapper.dart';
import 'package:bside_todolist/common/components/ui/system/box_shadow.dart';
import 'package:bside_todolist/common/components/ui/system/colors.dart';
import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:bside_todolist/questions/create/components/image_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

Map<int, String> questionTypes = {0: '주관식', 1: '객관식'};

Map<int, String> difficultTypes = {
  0: '어려움',
  1: '보통',
  2: '쉬움',
};

Map<int, String> incorrectReasons = {
  0: '개념 이해 부족',
  1: '시간 관리 부족',
  2: '단순 실수',
};

class QuestionsCreateScreen extends StatefulWidget {
  const QuestionsCreateScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsCreateScreen> createState() => _QuestionsCreateScreenState();
}

class _QuestionsCreateScreenState extends State<QuestionsCreateScreen> {
  List<String> _questionPictures = [];
  List<String> _answerPictures = [];
  List<String> _keywords = [];
  Map<String, String?> _answers = {
    '1': null,
    '2': null,
    '3': null,
    '4': null,
    '5': null,
  };
  final _titleController = TextEditingController();
  final _answerController = TextEditingController();
  final _memoController = TextEditingController();
  final _keywordController = TextEditingController();
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

  void submit(BuildContext context) async {
    // validate form values
    print('start');

    var correctAnswers = _questionType == 0
        ? [_answerController.text]
        : _answers.values.whereType<String>().toList();

    print(correctAnswers);

    // // post imagese

    // TODO: 원본, 압축본 둘 다 로컬에 저장되고 있음 => 중복없게 어떻게 처리할 것인지
    final List<MultipartFile> answerImages = [];

    for (var picture in _answerPictures) {
      var result = await FlutterImageCompress.compressAndGetFile(
          picture, picture + 'c.jpeg',
          quality: 1);

      answerImages.add(
        MultipartFile.fromBytes(
          result != null
              ? await result.readAsBytes()
              : File(picture).readAsBytesSync(),
          filename: picture,
          contentType: MediaType('application', 'octet-stream'),
        ),
      );
    }

    final List<MultipartFile> questionImages = [];

    for (var picture in _questionPictures) {
      var result = await FlutterImageCompress.compressAndGetFile(
          picture, picture + 'c.jpeg',
          quality: 1);

      questionImages.add(
        MultipartFile.fromBytes(
          result != null
              ? await result.readAsBytes()
              : File(picture).readAsBytesSync(),
          filename: picture,
          contentType: MediaType('application', 'octet-stream'),
        ),
      );
    }

    print('post question images start');
    var postImagesRseponse = await getApiClient().postImagesQuestions(
      questionImages,
      answerImages,
    );
    print('post question images end');

    var answerImageUrls = postImagesRseponse.data.answerImageUrls;
    var questionImageUrls = postImagesRseponse.data.questionImageUrls;

    print('post questions start');

    print(_memoController.text);
    print(_titleController.text);

    await getApiClient().postQuestions(
      PostQuestionsRequest(
        subjectName: '기본 폴더',
        title: _titleController.text,
        questionType: questionTypes[_questionType]!,
        difficultyType: difficultTypes[_difficultType]!,
        memo: _memoController.text,
        correctAnswers: correctAnswers,
        incorrectReason: incorrectReasons[_incorrectReason]!,
        keywords: _keywords,
        questionImageUrls: questionImageUrls,
        answerImageUrls: answerImageUrls,
        // questionImageUrls: ['https://picsum.photos/200/300'],
        // answerImageUrls: ['https://picsum.photos/200/300'],
      ),
    );
    print('post questions end');
  }

  Widget buildFolderDropdownMenu() {
    return FutureBuilder(
      future: getApiClient().getSubjects(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return DropdownMenu(
            width: MediaQuery.of(context).size.width - 32,
            initialSelection: '기본 폴더',
            dropdownMenuEntries: const [
              DropdownMenuEntry(
                value: '기본 폴더',
                label: '기본 폴더',
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return DropdownMenu(
            width: MediaQuery.of(context).size.width - 32,
            initialSelection: '기본 폴더',
            dropdownMenuEntries: const [
              DropdownMenuEntry(
                value: '기본 폴더',
                label: '기본 폴더',
              ),
            ],
          );
        } else {
          return DropdownMenu(
            width: MediaQuery.of(context).size.width - 32,
            initialSelection: '기본 폴더',
            dropdownMenuEntries: snapshot.data!.data.subjects
                .sublist(1)
                .map(
                  (subject) => DropdownMenuEntry(
                      value: subject.subjectName, label: subject.subjectName),
                )
                .toList(),
          );
        }
      },
    );
  }

  Widget buildAnswerRadio(String index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          var newAnswers = {..._answers};
          print(newAnswers.toString());
          if (newAnswers[index] == null) {
            newAnswers[index] = index;
          } else {
            newAnswers[index] = null;
          }
          print(newAnswers.toString());
          _answers = newAnswers;
        });
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(0),
        maximumSize: const Size(24, 24),
        minimumSize: const Size(24, 24),
        side: BorderSide(
          width: 2,
          color: _answers[index] == null
              ? MyColors.blackBasic
              : MyColors.starGreen,
        ),
      ),
      child: Text(
        index,
        style: MyTexts.KR14700.copyWith(
            color: _answers[index] == null
                ? MyColors.blackBasic
                : MyColors.starGreen,
            fontSize: 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    bool isKeyboardOpened = bottom > 0;

    print(_questionPictures);
    return SafeArea(
      child: KeyboardDismissOnTap(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: MyColors.starGreen,
            leading: IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                context.pop();
              },
            ),
            title: const Text('문제 등록'),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            // problem document scanner
                            CardWrapper(
                              borderRadius: 4,
                              child: SizedBox(
                                height: 360,
                                width: double.infinity,
                                child: _questionPictures.isEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          List<String> pictures;

                                          try {
                                            pictures =
                                                await CunningDocumentScanner
                                                        .getPictures(true) ??
                                                    [];

                                            if (!mounted) return;

                                            print(_questionPictures);
                                            setState(() {
                                              _questionPictures = pictures;
                                            });
                                          } catch (exception) {
                                            print(exception);
                                            // Handle exception here
                                          }
                                        },
                                        child: const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.camera_alt_outlined,
                                              color: MyColors.starGreen,
                                              size: 24,
                                            ),
                                            SizedBox(height: 26),
                                            Text('문제를 등록해 보세요'),
                                          ],
                                        ),
                                      )
                                    : ImageCarouselSlider(images: [
                                        for (var picture in _questionPictures)
                                          Image.file(
                                            File(picture),
                                            fit: BoxFit.fill,
                                          )
                                      ]),
                              ),
                            ),
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
                              margin: const EdgeInsets.only(left: 8),
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
                                const Text('주관식', style: MyTexts.KR14400),
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
                                const Text('객관식', style: MyTexts.KR14400),
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
                              margin: const EdgeInsets.only(left: 8),
                              child: _questionType == 0
                                  ? TextFormField(
                                      controller: _answerController,
                                      decoration: InputDecoration(
                                        hintText: '주관식 답을 입력해주세요',
                                        border: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: MyColors.starGreen),
                                        ),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: MyColors.starGreen),
                                        ),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: MyColors.starGreen),
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: _answerController.clear,
                                          icon: const Icon(
                                            Icons.clear_rounded,
                                            color: MyColors.starGreen,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Row(
                                      children: [
                                        buildAnswerRadio('1'),
                                        buildAnswerRadio('2'),
                                        buildAnswerRadio('3'),
                                        buildAnswerRadio('4'),
                                        buildAnswerRadio('5'),
                                      ],
                                    ),
                            ),
                            const SizedBox(height: 40),
                            const Text('오답 정보', style: MyTexts.KR17700),
                            const SizedBox(height: 24),
                            const Text('틀린 이유', style: MyTexts.KR14700),
                            Row(
                              children: [
                                const SizedBox(width: 8),
                                const Text('개념 이해 부족', style: MyTexts.KR14400),
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
                                const Text('시간 관리 부족', style: MyTexts.KR14400),
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
                                const SizedBox(width: 8),
                                const Text('문제 해독 미숙', style: MyTexts.KR14400),
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
                                const Text('단순 실수', style: MyTexts.KR14400),
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
                                const SizedBox(width: 8),
                                const Text('어려움', style: MyTexts.KR14400),
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
                                const Text('보통', style: MyTexts.KR14400),
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
                                const Text('쉬움', style: MyTexts.KR14400),
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
                            // problem document scanner
                            InkWell(
                              onTap: () async {
                                List<String> pictures;

                                try {
                                  pictures =
                                      await CunningDocumentScanner.getPictures(
                                              true) ??
                                          [];

                                  if (!mounted) return;

                                  setState(() {
                                    _answerPictures = pictures;
                                  });
                                } catch (exception) {
                                  print(exception);
                                  // Handle exception here
                                }
                              },
                              child: CardWrapper(
                                borderRadius: 4,
                                child: SizedBox(
                                  height: 360,
                                  width: double.infinity,
                                  child: _answerPictures.isEmpty
                                      ? const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.camera_alt_outlined,
                                              color: MyColors.starGreen,
                                              size: 24,
                                            ),
                                            SizedBox(height: 26),
                                            Text('해설을 등록해 보세요'),
                                          ],
                                        )
                                      : ImageCarouselSlider(images: [
                                          for (var picture in _answerPictures)
                                            Image.file(File(picture))
                                        ]),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            const Text('메모', style: MyTexts.KR14700),
                            Container(
                              margin: const EdgeInsets.only(left: 8),
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
                              margin: const EdgeInsets.only(left: 8),
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
                                                padding:
                                                    const EdgeInsets.fromLTRB(
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
                                                                  (keyword) =>
                                                                      keyword !=
                                                                      keyword)
                                                              .toList();
                                                        });
                                                      },
                                                      child: const SizedBox(
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
                                      if (_keywordController.value.text == '')
                                        return;

                                      setState(() {
                                        _keywords = {
                                          ..._keywords,
                                          _keywordController.value.text
                                        }.toList();
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
                            const SizedBox(height: 16),
                            buildFolderDropdownMenu(),
                            const SizedBox(height: 40),
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 11),
                            child: MyButton(
                              onPressed: () => submit(context),
                              type: MyButtonType.starGreen,
                              child: const Text('문제와 해설 등록하기'),
                            ),
                          );
                        }

                        return const Text('');
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 11),
                        child: MyButton(
                          onPressed: () => submit(context),
                          type: MyButtonType.starGreen,
                          child: const Text('문제와 해설 등록하기'),
                        ),
                      ),
                    )
                  : const Text(''),
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
        _questionPictures = pictures;
      });
    } catch (exception) {
      print(exception);
      // Handle exception here
    }
  }
}
