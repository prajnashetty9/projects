import 'dart:math';
class CalculatorBrain
{
  CalculatorBrain({this.height,this.weight});
  final int height;
  final int weight;
  double _bmiValue;

  String bmiCalculator()
  {
   _bmiValue=(weight/pow(height/100, 2));
   return _bmiValue.toStringAsFixed(1);
  }
  String getResult()
  {
    if(_bmiValue>=25) {
      return "overWeight";
    }
          else if(_bmiValue>18.5) {
              return "normal";
            }
          else{
            return "underWieght";

    }
  }

  String getInterpretation()
  {
    if(_bmiValue>=25) {
      return "You have higher weight then the normal,You need to workout";
    }
    else if(_bmiValue>18.5) {
      return 'You have normal weight.Good job ';
    }
    else{
      return "You have lower weight then the normal,You need to eat lot";

    }
  }
}