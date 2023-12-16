import 'package:bside_todolist/common/components/ui/system/box_shadow.dart';
import 'package:bside_todolist/common/components/ui/system/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCardWrapper extends StatelessWidget {
  final Widget child;
  final double borderRadius;

  const MyCardWrapper({
    super.key,
    required this.child,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.cardFill,
        boxShadow: <BoxShadow>[MyBoxShadows.cardShadow],
        border: Border.all(
          width: 1,
          color: MyColors.cardStroke,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
