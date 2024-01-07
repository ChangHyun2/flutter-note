import 'package:bside_todolist/common/components/ui/system/colors.dart';
import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:flutter/material.dart';

class MyButtonType {
  MyButtonType._();

  static const String starGreen = 'starGreen';
  static const String starGreenInverse = 'starGreenInverse';
}

Map<String, ButtonStyle> myButtonStyle = {
  'starGreen': ButtonStyle(
    foregroundColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) => states.isEmpty ? Colors.white : null),
    backgroundColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) =>
            states.isEmpty ? MyColors.starGreen : null),
    textStyle: MaterialStateProperty.all(
      MyTexts.KRBold14.copyWith(color: Colors.white),
    ),
    padding: MaterialStateProperty.all(
      EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    ),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
    shape: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }

      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: MyColors.starGreen,
        ),
      );
    }),
  )
};

class MyButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final String type;

  const MyButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: myButtonStyle[type],
      child: child,
    );
  }
}
