import 'package:flutter/painting.dart';

class AppTextStyle {
  static TextStyle getRoundedBackGound(
      {required double fontSize,
      required Color backGroundColor,
      required Color textColor,}) {
    return TextStyle(
      color: textColor,
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      background: Paint()
        ..strokeWidth = fontSize + 10
        ..color = backGroundColor
        ..style = PaintingStyle.stroke
        ..strokeJoin = StrokeJoin.round,
    );
  }
}
