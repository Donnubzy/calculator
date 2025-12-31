
import 'package:calculator/model/calc_logic.dart';
import 'package:flutter/material.dart';

class CalculatorModel extends ChangeNotifier{
  String operator = "";
  double? firstNumber;
  double? secondNumber;

  String _display = "";
  String get display => _display;

  bool _isNatural = false;
  bool get isNatural => _isNatural;

  late List<String> memory = [];
  var piValue = CalculatorLogic().piValue;
  var randomValue = CalculatorLogic().randomValue;
  var eValue = CalculatorLogic().eValue;

  void memoryActions(String mem){
      if(mem == "M+") {
        memory.add(_display);
      }
      else if (mem == "Mc"){
        memory.clear();
      }
      else if(mem == "M-"){
        if(memory.isNotEmpty) {
          memory.removeLast();
        }
      }
      // Checks list range first before assigning values to be retrieved 'Mr'
      else {
        if (memory.isNotEmpty){
          firstNumber = double.tryParse(memory[0]) ?? 0;
          _display = firstNumber.toString();
        }
      }
      notifyListeners();
  }

  void valuePressed(String value){
      _display += value;
      if(operator.isEmpty){
        if(value == "π"){
          firstNumber = piValue;
        }
        else if(value == "e"){
          firstNumber = eValue;
        }
        else {
          firstNumber = randomValue;
        }
      }
      else {
        if(value == "π"){
          secondNumber = double.tryParse(piValue.toString().substring(
              piValue.toString().indexOf(operator) + 1));
        }
        else if(value == "e"){
          secondNumber = double.tryParse(eValue.toString().substring(
              eValue.toString().indexOf(operator) + 1));
        }
        else {
          secondNumber = double.tryParse(randomValue.toString().substring(
              randomValue.toString().indexOf(operator) + 1));
        }
      }
      notifyListeners();
  }

  void numberPressed(String number){
    _display += number;
    if(operator.isEmpty){
      firstNumber = double.tryParse(_display);
    } else {
      secondNumber = double.tryParse(
          _display.substring(_display.indexOf(operator) + 1));
    }
    notifyListeners();
  }

  /// TODO : Setup raise to power function
  // void raiseToPowerPressed(String op, double? second){
  //   if(firstNumber == null) { return;}
  //     operator = op;
  //     _display += "^$second";
  //     notifyListeners();
  // }

  void operatorPressed(String op){
    if(firstNumber == null) {return;}
    else if ("! √ sin cos tan log₁₀ log₂ ln x² x³ sin⁻¹ cos⁻¹ tan⁻¹ 10ˣ"
        .contains(op)){
        operator = op;
        secondNumber = 0;
        // Individual displays on operator pressed
        if(op == "x²") {_display = "${firstNumber!.toInt()}²";}
        else if(op == "x³") {_display = "${firstNumber!.toInt()}³"; }
        else if (op == "10ˣ") {_display = "10ˣ${firstNumber!.toInt()}";}
        else if ("!".contains(op)) {_display = "${firstNumber!.toInt()}!";}
        else if (op == "√") {_display = "$op$firstNumber";}
        else {_display = "$op($firstNumber)";}
    }

    /// TODO : Setup Parenthesis
    // else if (op == "("){
    //   setState(() {
    //     operator = op;
    //     display = "${firstNumber!.toInt()}$op${secondNumber!.toInt()})";
    //   });
    // }
    // else if ("(-)".contains(op)){
    //   setState(() {
    //     operator = op;
    //     display = "${-(firstNumber!.toInt())}";
    //   });
    // }

    else {
        operator = op;
        _display += op;
    }
    notifyListeners();
  }

  void equalsPressed() {
    if(firstNumber != null && secondNumber != null && operator.isNotEmpty){
      try{
        double solved = CalculatorLogic().calculations(firstNumber!,
            secondNumber!, operator);
          _display = "$display\n$solved";
          firstNumber = solved;
          secondNumber = null;
          operator = "";
      }
      catch (e) {
          _display = "Error";
      }
    }
    else if(firstNumber == piValue){
        _display = "$piValue";
    }
    else if(firstNumber == eValue){
        _display = "$eValue";
    }
    else if(firstNumber == randomValue){
        _display = "$randomValue";
    }
    notifyListeners();
  }

  void clearDisplay() {
      _display = "";
      operator = "";
      firstNumber = null;
      secondNumber = null;
      notifyListeners();
  }

  void delete(){
    if(_display.isNotEmpty) {
      var del = display.substring(0,display.length - 1);
      _display = del;
      notifyListeners();
    }
  }

  // Switch to inverse values on buttons
  void inverseValues(){
      _display = "";
      _isNatural = !_isNatural;
      notifyListeners();
  }

  // Calls all the functions within the model
  void buttonsCallback(String btn){
    if (btn == "AC") { clearDisplay(); }
    else if(btn == "DEL") { delete(); }
    else if (" + - × ÷ √ sin cos tan log₁₀ log₂ ln (-) ! ( ) % x² x³ 10ˣ "
        "sin⁻¹ cos⁻¹ tan⁻¹ ".contains(btn))
    { operatorPressed(btn); }
    //else if (btn == "xʸ") {raiseToPowerPressed(btn, secondNumber);}
    else if ("=".contains(btn)) { equalsPressed(); }
    else if ("π e Ran".contains(btn)) { valuePressed(btn); }
    else if (btn == "2nd") { inverseValues();}
    else if ("Mr Mc M+ M-".contains(btn)) { memoryActions(btn); }
    else { numberPressed(btn); notifyListeners();}
    notifyListeners();
  }
}
