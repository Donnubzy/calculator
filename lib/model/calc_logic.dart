
import 'dart:math';

class CalculatorLogic {
  double calculations (double a, double b, String operator) {
    switch(operator) {
      case "+" :
        return a + b;
      case "-" :
        return a - b;
      case "×" :
        return a * b;
      case "÷" :
        if (b == 0) throw Exception("Cannot Divide by Zero");
        return a / b;
      case '√' :
        return sqrt(a);
      case "x²" :
        return raiseAToPowerB(a, 2);
      case "x³" :
        return raiseAToPowerB(a, 3);
      case "xʸ" :
        return raiseAToPowerB(a, b);
      case "|oˣ" :
        return raiseAToPowerB(10, a);
      case "log₁₀" :
        return log(a) / ln10;
      case "log₂" :
        return logAToBaseB(a, 2);
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
      case "sin⁻¹" :
        return trigSinInv(a);
      case "cos⁻¹" :
        return trigCosInv(a);
      case "tan⁻¹" :
        return trigTanInv(a);
      // case "eˣ" :
      //   return pow(eValue, a).toDouble();
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

  /// FACTORIAL
  double factorial(double number){
    if(number <= 1) return 1;
    return number * factorial(number - 1);
  }

  /// LOGARITHM
  double logAToBaseB(double a, int b){
    double prod = a;
    double num = 0;
    while(1 < prod){
      num ++;
      prod = (prod / b);
    }
    return num;
  }

  /// RAISE TO POWER
  double raiseAToPowerB(double a, double b){
    double prod = a;
    for(double i = 1; i < b; i++){
      prod *= a;
    }
    return prod;
  }

  double get piValue => pi;
  double get eValue => e;
  double get randomValue => Random().nextInt(100).toDouble();
}
