import 'package:solid_software_test_task/utils/random_numbers_generator/my_random.dart';

/// Random generator that uses Linear congruential generator algorithm
class MyLCRandom extends MyRandom {
  int _seed;
  final int _multiplier;
  final int _increment;

  MyLCRandom([this._seed = 1, this._multiplier = 1, this._increment = 1]);

  @override
  int getNextInt(int max) {
    return _seed = (_multiplier * _seed + _increment) % max;
  }
}
