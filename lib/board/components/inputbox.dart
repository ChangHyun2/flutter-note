import 'package:flutter/material.dart';

class BoardCommentTextfield extends StatelessWidget {
  final String text;
  final String labelText;
  final bool require;

  const BoardCommentTextfield({
    Key? key,
    required this.text,
    required this.labelText,
    required this.require,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Text(
                text,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              ),
              if (require)
                const Text(
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
              hintText: labelText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.grey, // 여기에 테두리 색상을 명시적으로 지정
                ),
              ),
              filled: true,
              fillColor: const Color(0xfffcfcfc),
            ),
          ),
        ),
      ],
    );
  }
}
