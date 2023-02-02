import 'package:flutter/material.dart';

class ColorProcessor {
  static
  Color getColorLightness(Color backgroundColor) {
    if (ThemeData.estimateBrightnessForColor(backgroundColor) ==
        Brightness.dark) {
      return Colors.white;
    }

    return Colors.black;
  }

  static Color changeLightness (double coefficient, Color color) {
    print(coefficient);
    if (coefficient >= 0.5) {
      final int redVal = color.red != 255
          ? (color.red +
          (255 - color.red) * (coefficient - 0.5) / 0.5)
          .round()
          : 255;
      final int greenVal = color.green != 255
          ? (color.green +
          (255 - color.green) * (coefficient - 0.5) / 0.5)
          .round()
          : 255;
      final int blueVal = color.blue != 255
          ? (color.blue +
          (255 - color.blue) * (coefficient - 0.5) / 0.5)
          .round()
          : 255;

      return Color.fromARGB(255, redVal, greenVal, blueVal);
    } else if (coefficient < 0.5) {
      final int redVal = color.red != 0
          ? (color.red * coefficient / 0.5).round()
          : 0;
      final int greenVal = color.green != 0
          ? (color.green * coefficient / 0.5).round()
          : 0;
      final int blueVal = color.blue != 0
          ? (color.blue * coefficient / 0.5).round()
          : 0;

      return Color.fromARGB(255, redVal, greenVal, blueVal);
    } else {
      return color;
    }
  }
}
