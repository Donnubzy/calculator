
import 'dart:math';
import 'package:calculator/util/styling.dart';

class CalculatorLogic {
  double calculations (double a, double b, String operator) {
    switch(operator) {
      case "+" :
        return a + b;
      case "-" :
        return a - b;
      case "x" :
        return a * b;
      case "/" :
        if (b == 0) throw Exception("Cannot Divide by Zero");
        return a / b;
      case 'sqrt' :
        return sqrt(a);
      case squareOf :
        return pow(a, 2).toDouble();
      case cubeOf :
        return pow(a, 3).toDouble();
      case raiseToPower :
        return pow(a, b).toDouble();
      case tenRaiseToNumerator :
        return pow(10, a).toDouble();
      case "log" :
        return log(a) / ln10;
      case "ln" :
        return log(a);
      case "!" :
        return factorial(a);
      case "sin" :
        return trigSin(a);
      case "cos" :
        return trigCos(a);
      case "tan" :
        return trigTan(a);
      case sinInverse :
        return trigSinInv(a);
      case cosInverse :
        return trigCosInv(a);
      case tanInverse :
        return trigTanInv(a);
      case "%" :
        return (a / 100) * b;
      case "(" :
        return a * b;
      case ")" :
        return 0.1;
      default :
        throw UnsupportedError("Invalid Operator");
    }
  }

  /// TRIG FUNCTIONS
  double rtd(double rad) => rad * pi / 180;
  double trigSin(double x) => sin(rtd(x));
  double trigCos(double x) => cos(rtd(x));
  double trigTan(double x) => tan(rtd(x));

  /// TRIG INVERSE FUNCTIONS
  double radToDeg(double rad) => rad * 180 / pi;
  double trigSinInv(double x) => radToDeg(asin(x));
  double trigCosInv(double x) => radToDeg(acos(x));
  double trigTanInv(double x) => radToDeg(atan(x));
  
  double factorial(double number){
    if(number <= 1) return 1;
    return number * factorial(number - 1);
  }

  double get piValue => pi;
  double get eValue => e;
  double get randomValue => Random().nextInt(100).toDouble();
}
