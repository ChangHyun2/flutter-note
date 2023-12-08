import 'package:bside_todolist/design_system/box_shadow.dart';
import 'package:bside_todolist/design_system/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButtonType {
  MyButtonType._();

  static const String starGreen = 'primary';
  static const String starGreenInverse = 'primaryInverse';
}

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
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
