import 'package:flutter/material.dart';

/// Class for computing util operations with color
class ColorProcessor {
  /// Determines what color [white or black]  would be visible in contrast to input color
  static Color getContrastColor(Color backgroundColor) {
    if (ThemeData.estimateBrightnessForColor(backgroundColor) == Brightness.dark) {
      return Colors.white;
    }

    return Colors.black;
  }

  /// Changes the shade of the color without changing the color itself.
  /// If the result is out of [0;1] range, it sets 0 or 1.
  static Color changeLightness(double coefficient, Color color) {
    double resultCoefficient = coefficient;
    if (coefficient > 1) {
      resultCoefficient = 1;
    } else if (coefficient < 0) {
      resultCoefficient = 0;
    }

    return HSVColor.fromColor(color).withValue(resultCoefficient).toColor();
  }

  /// Returns the lightness of the color
  static double getLightness(Color color) {
    return HSVColor.fromColor(color).value;
  }
}
