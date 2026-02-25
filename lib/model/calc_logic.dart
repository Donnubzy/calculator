
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
        return pow(a, 2).toDouble();
      case "x³" :
        return pow(a, 3).toDouble();
      case "xʸ" :
        return pow(a, b).toDouble();
      case "|oˣ" :
        return pow(10, a).toDouble();
      case "log₁₀" :
        return log(a) / ln10;
      case "log₂" :
        return logAToBaseB(a.toInt(), 2).toDouble();
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
  int logAToBaseB(int a, int b){
    var sum = a;
    var num = 0;
    while(1 < sum){
      num ++;
      sum = (sum / b).toInt();
    }
    return num;
  }


  double get piValue => pi;
  double get eValue => e;
  double get randomValue => Random().nextInt(100).toDouble();
}
