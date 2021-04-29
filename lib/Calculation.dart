import 'dart:math';

import 'package:flutter/material.dart';

class CalculateBrain {
  CalculateBrain({@required this.height, this.weight});

  final int height;
  final int weight;
  double bmi;
  String bMI() {
    bmi = weight / pow(height / 100, 2);
    print(bmi);

    return bmi.toStringAsFixed(1);
  }

  String result() {
    if (bmi >= 25.0)
      return 'Overweight';
    else if (bmi >= 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String advice() {
    if (bmi >= 25)
      return 'try to do some exercise';
    else if (bmi >= 18.5)
      return 'you are fit';
    else
      return 'try to eat something';
  }
}
