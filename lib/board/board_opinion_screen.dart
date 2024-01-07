import 'package:bside_todolist/board/components/inputbox.dart';
import 'package:bside_todolist/common/provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BoardOpinionScreen extends StatelessWidget {
  const BoardOpinionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = context.watch<AuthProvider>();
    String? nickname = authProvider.kakaoUser?.kakaoAccount?.profile?.nickname;

    return Stack(children: [
      SingleChildScrollView(
          child: Column(children: [
        const SizedBox(
          height: 36,
        ),
        const BoardCommentTextfield(
          text: '닉네임',
          labelText: '수험생123',
          require: false,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.topLeft,
          child: const Row(
            children: [
              Text(
                '유형선택',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              ),
              Text(
                '*',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        DropdownMenu(
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
        const BoardCommentTextfield(
          text: '제목',
          labelText: '제목을 입력해주세요',
          require: true,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.topLeft,
          child: const Row(
            children: [
              Text(
                '문의사항',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              ),
              Text(
                '*',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: '오류에 대한 문의는 자세하게 작성해주세요.\n문제를 빠르게 파악하고 처리해드릴 수 있어요.',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.grey, // 여기에 테두리 색상을 명시적으로 지정
                ),
              ),
              filled: true,
              fillColor: const Color(0xfffcfcfc),
            ),
            maxLines: 6,
            maxLength: 300,
          ),
        ),
      ]))
    ]);
  }
}
