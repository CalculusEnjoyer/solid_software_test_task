import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:solid_software_test_task/utils/random_numbers_generator/my_fibonacci_random/my_fibonacci_random.dart';
import 'package:solid_software_test_task/utils/random_numbers_generator/my_random.dart';

/// Generates random color.
///
/// Use MyRandom instance for generation of a random number.
class ColorGenerator {

  /// Max possible int value of the Color
  static const int maxColorRange = 0xFFFFFFFF;
  MyRandom randomGenerator = MyFibonacciRandom();

  ColorGenerator(this.randomGenerator);

  /// Generates random color with its int value in [startRange,finalRange] range
  Color generateColor(int startRange, int finalRange) {
    if (!_validateColorRange(startRange, finalRange)) {
      throw ArgumentError("Wrong input range");
    }
    final int value = randomGenerator.getNextInt(finalRange - startRange) + startRange;

    return Color(value);
  }

  static bool _validateColorRange(int startRange, int finalRange) {
    return startRange <= maxColorRange &&
        startRange >= 0 &&
        finalRange <= maxColorRange &&
        finalRange >= 0 &&
        startRange < finalRange;
  }
}
