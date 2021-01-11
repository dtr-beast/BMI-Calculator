import 'dart:math';

import 'package:flutter/cupertino.dart';

class BMICalculate {
  BMICalculate(
      {@required this.height, @required this.weight, @required this.age});

  final int height, weight, age;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBMIStatus() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi >= 18.5) {
      return 'HEALTHY';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getBMIStatusText() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight, Good job!';
    } else {
      return 'You have a lower than normal body weight, You can eat a bit more.';
    }
  }
}
