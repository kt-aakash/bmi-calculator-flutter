import 'dart:math';
class CalculatorBrain{

  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi = 0.0;

  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return 'over weight';
    }
    else if(_bmi > 18.5 && _bmi < 25){
      return 'normal';
    }
    else if(_bmi <= 18.5){
      return 'under weight';
    }
  }

  String getInterpret(){
    if(_bmi >= 25){
      return 'You seem to have more than required calories !';
    }
    else if(_bmi > 18.5 && _bmi < 25){
      return 'You have just the perfect amount !';
    }
    else if(_bmi <= 18.5){
      return 'You don\'t seem to have the required calories';
    }
  }
}