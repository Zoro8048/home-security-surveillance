import 'package:flutter/material.dart';

extension CustomColors on ColorScheme {
  Color get backgroundColor => const Color.fromRGBO(255, 255, 255, 1);
  Color get successColor => const Color.fromRGBO(76, 175, 80, 1);
  Color get errorColor => const Color.fromRGBO(244, 67, 54, 1.0);
  Color get shadowColor => Colors.grey.shade400;
  Color get transparent => Colors.transparent;
  Color get dark => Colors.black;
}
