import 'package:solid_software_test_task/utils/random_numbers_generator/my_random.dart';

class MyFibonacciRandom extends MyRandom {
  int _firstNumber;
  int _secondNumber;

  MyFibonacciRandom([this._firstNumber = 1, this._secondNumber = 1]);

  @override
  int getNextInt(int max) {
    final int result = _firstNumber + _secondNumber;
    _firstNumber = _secondNumber;

    return _secondNumber = result % max;
  }
}
