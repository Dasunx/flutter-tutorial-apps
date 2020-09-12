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
      return 'wêl nr';
    } else if (_bmi > 18.5) {
      return 'idudkHhs';
    } else {
      return 'wvq nr';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Tng idudkH YÍr ialkaO o¾Ylhg jvd by< w.hla we;';
    } else if (_bmi > 18.5) {
      return 'Tng idudkH YÍr ialkaO o¾Ylhla we;" Tfí wdydr fõ, wkq.ukh lrkak';
    } else {
      return 'idudkH mqoa.,hdg jvd wvq YÍr ialkaO o¾Ylhla Tng ;sfí kï" fmdaIK wdydr ,nd .kak';
    }
  }
}
