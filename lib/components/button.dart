import 'package:bside_todolist/design_system/box_shadow.dart';
import 'package:bside_todolist/design_system/colors.dart';
import 'package:bside_todolist/design_system/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';

class MyButtonType {
  MyButtonType._();

  static const String starGreen = 'starGreen';
  static const String starGreenInverse = 'starGreenInverse';
}

Map<String, ButtonStyle> myButtonStyle = {
  'starGreen': ElevatedButton.styleFrom(
    foregroundColor: MyColors.starGreen,
    backgroundColor: Colors.white,
    textStyle: MyTexts.KRBold14,
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: BorderSide(color: MyColors.starGreen),
    ),
    shadowColor: Colors.transparent,
  ),
};

class MyButton extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;
  final String type;

  const MyButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    print(this.type);
    print(type);
    print(myButtonStyle);
    print(myButtonStyle[type]);

    return ElevatedButton(
      onPressed: onPressed,
      style: myButtonStyle[type],
      child: child,
    );
  }
}
