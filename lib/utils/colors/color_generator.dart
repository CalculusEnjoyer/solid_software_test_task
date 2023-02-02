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

  /// Because two highest digits of the number represent the alpha parameter,
  /// colors in range [minColorRangeWithFullAlpha, maxColorRange] will be
  /// fully opaque and they will represent all color line at the same time.
  ///
  /// So this constant is used to generate random fully opaque color.
  static const int minColorRangeWithFullAlpha = 0xFF000000;

  MyRandom randomGenerator = MyFibonacciRandom();

  ColorGenerator(this.randomGenerator);

  /// Generates random color with its int value in [startRange,finalRange] range
  ///
  /// Input values must be in [0, maxColorRange] range
  Color generateColor(int startRange, int finalRange) {
    if (!_validateColorRange(startRange, finalRange)) {
      throw ArgumentError("Wrong input range");
    }
    final int value = randomGenerator.getNextInt(finalRange - startRange) + startRange;

    return Color(value);
  }

  /// Generates fully opaque random color with its int value in [startRange,finalRange] range
  Color generateFullyOpaqueColor() {

    return generateColor(minColorRangeWithFullAlpha, maxColorRange);
  }

  static bool _validateColorRange(int startRange, int finalRange) {
    return startRange <= maxColorRange &&
        startRange >= 0 &&
        finalRange <= maxColorRange &&
        finalRange >= 0 &&
        startRange < finalRange;
  }
}
