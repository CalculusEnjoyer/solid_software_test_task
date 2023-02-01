import 'dart:ui';

class ColorProcessor {
  static changeDarkness (double coefficient, Color color) {
    if (coefficient >= 0.5) {
      int redVal = color.red != 255
          ? (color.red +
          (255 - color.red) * (coefficient - 0.5) / 0.5)
          .round()
          : 255;
      int greenVal = color.green != 255
          ? (color.green +
          (255 - color.green) * (coefficient - 0.5) / 0.5)
          .round()
          : 255;
      int blueVal = color.blue != 255
          ? (color.blue +
          (255 - color.blue) * (coefficient - 0.5) / 0.5)
          .round()
          : 255;
      return Color.fromARGB(255, redVal, greenVal, blueVal);
    } else if (coefficient < 0.5) {
      int redVal = color.red != 0
          ? (color.red * coefficient / 0.5).round()
          : 0;
      int greenVal = color.green != 0
          ? (color.green * coefficient / 0.5).round()
          : 0;
      int blueVal = color.blue != 0
          ? (color.blue * coefficient / 0.5).round()
          : 0;
      return Color.fromARGB(255, redVal, greenVal, blueVal);
    } else {
      return color;
    }
  }
}