import 'dart:math';

class CaculatorBrain {
  CaculatorBrain(this.weight, this.height);
  final double height;
  final int weight;
  

  double _bmi = 0.0;
  String calulateBMI() {
    double _bmi = weight / pow(height, 2);
    //Round anh convert to string
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInteroretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
