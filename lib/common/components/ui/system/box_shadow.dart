import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyBoxShadows {
  MyBoxShadows._();

  static const BoxShadow cardShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.08),
    offset: Offset(2, 4),
    blurRadius: 10,
  );

  static const BoxShadow bottomShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.05),
    offset: Offset(0, -5),
    blurRadius: 15,
  );
}
