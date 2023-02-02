/// Random generator abstract class
abstract class MyRandom {
  static const maxInt = 0x8000000000000000;

  /// Generates random integer in [0, maxInt] range
  int getNextInt(int max);

  /// Generates random double based on random generated integer
  double getNextDouble() {
    double result = getNextInt(MyRandom.maxInt).toDouble();
    while (result >= 1.0) {
      result /= 10;
    }

    return result;
  }
}
