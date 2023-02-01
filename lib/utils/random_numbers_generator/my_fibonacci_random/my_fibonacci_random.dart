import '../my_random.dart';

class MyFibonacciRandom implements MyRandom {
  int _firstNumber;
  int _secondNumber;

  MyFibonacciRandom([this._firstNumber = 1, this._secondNumber = 1]);

  @override
  double getNextDouble() {
    double result = getNextInt(MyRandom.maxInt).toDouble();
    while (result >= 1.0) {
      result /= 10;
    }
    return result;
  }

  @override
  int getNextInt(int max) {
    int result = _firstNumber + _secondNumber;
    _firstNumber = _secondNumber;
    _secondNumber = result;
    return result % max;
  }
}
