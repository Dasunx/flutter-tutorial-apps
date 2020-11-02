import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'max';
    } else if (_bmi > 18.5) {
      return 'normal';
    } else {
      return 'min';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'maxMsg';
    } else if (_bmi > 18.5) {
      return 'normalMsg';
    } else {
      return 'minMsg';
    }
  }
}
