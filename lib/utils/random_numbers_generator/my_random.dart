abstract class MyRandom {
  static const maxInt = 0x8000000000000000;

  int getNextInt(int max);

  double getNextDouble() {
    double result = getNextInt(MyRandom.maxInt).toDouble();
    while (result >= 1.0) {
      result /= 10;
    }

    return result;
  }
}
