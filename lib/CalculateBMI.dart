import 'dart:math';
class CalculateBMI{

  CalculateBMI({required this.weight, required this.height});
  final int height;
  final int weight;
  double _bmi=0.0;
  String Calculate(){

    _bmi = weight / pow(height/100, 2);

    return _bmi.toStringAsFixed(1);
  }

  String getText(){
    if(_bmi>=25.0){
      return 'Overweight';
    }else if(_bmi>=18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }

  String getInfo(){
    if(_bmi>=25.0){
      return 'You have higher than normal body weight. Try to exercise more!';
    }else if(_bmi>=18.5){
      return 'You have normal body weight, Good job!';
    }else{
      return 'You have lower than normal body weight. You can eat more!';
    }
  }
}