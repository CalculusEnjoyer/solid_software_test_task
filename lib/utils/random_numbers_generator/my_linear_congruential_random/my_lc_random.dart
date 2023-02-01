import '../my_random.dart';

class MyLCRandom implements MyRandom {
  int seed;
  int multiplier;
  int increment;

  MyLCRandom([this.seed = 1, this.multiplier = 1, this.increment = 1]);

  // TODO dublicate code
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
    seed = (multiplier * seed + increment) % max;
    return seed;
  }
}