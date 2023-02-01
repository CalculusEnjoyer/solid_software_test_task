import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:solid_software_test_task/utils/random_numbers_generator/my_fibonacci_random/my_fibonacci_random.dart';
import 'package:solid_software_test_task/utils/random_numbers_generator/my_random.dart';



class ColorGenerator {
  static const int maxColorRange = 0xFFFFFFFF;
  MyRandom randomGenerator = MyFibonacciRandom();

  ColorGenerator(this.randomGenerator);

  Color generateColor (int startRange, int finalRange) {
    if (!_validateColorRange(startRange, finalRange)) throw ArgumentError("Wrong input range");
    int value = randomGenerator.getNextInt(finalRange - startRange) + startRange;
    // TODO Remove print
    print(value);
    return Color(value);
  }

  static bool _validateColorRange (int startRange, int finalRange) {
    if (startRange > maxColorRange || finalRange > maxColorRange || startRange > finalRange) {
      return false;
    } else {
      return true;
    }
  }
}