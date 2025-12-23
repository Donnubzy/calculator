
import 'package:calculator/util/styling.dart';
import 'package:flutter/material.dart';
import 'model/calc_logic.dart';
import 'package:calculator/ui/views/details_screen.dart';
import 'package:calculator/ui/views/buttons_view.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display = "";
  String operator = "";
  double? firstNumber;
  double? secondNumber;

  late List<String> memory = [];
  bool isNatural = false;
  var piValue = CalculatorLogic().piValue;
  var randomValue = CalculatorLogic().randomValue;
  var eValue = CalculatorLogic().eValue;

  void memoryActions(String mem){
    setState(() {
      if(mem == "M+") {
        memory.add(display);
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
      if (memory.isNotEmpty){
        firstNumber = double.tryParse(memory[0]) ?? 0;
        display = firstNumber.toString();
      }
    });
  }

  void valuePressed(String value){
    setState(() {
      display += value;
      if(operator.isEmpty){
        if(value == "Pi"){
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
        if(value == "Pi"){
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
    });
  }

  void numberPressed(String number){
    setState(() {
      display += number;
      if(operator.isEmpty){
        firstNumber = double.tryParse(display);
      }
      secondNumber = double.tryParse(display.substring(
          display.indexOf(operator) + 1
      ));
    });
  }

  /// TODO : Setup raise to power function
  void raiseToPowerPressed(String op, double? second){
    if(firstNumber == null) { return;}
    setState(() {
      operator = op;
      display += "^$second";
    });
  }

  void operatorPressed(String op){
    if(firstNumber == null) {return;}
    else if (''' ! sqrt sin cos tan log ln $sinInverse $cosInverse $tanInverse
    $squareOf $cubeOf $tenRaiseToNumerator '''.contains(op)){
      setState(() {
        operator = op;
        secondNumber = 0;
        // Individual displays on operator pressed
        if(op == squareOf) {display = "${firstNumber!.toInt()}^2";}
        else if(op == cubeOf) {display = "${firstNumber!.toInt()}^3"; }
        else if (op == tenRaiseToNumerator) {display = "10^${firstNumber!.toInt()}";}
        else if ("!".contains(op)) {display = "${firstNumber!.toInt()}!";}
        else {display = "$op($firstNumber)"; }
      });
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
      setState(() {
        operator = op;
        display += op;
      });
    }
  }

  void equalsPressed() {
    if(firstNumber != null && secondNumber != null && operator.isNotEmpty){
      try{
        double solved = CalculatorLogic().calculations(firstNumber!,
            secondNumber!, operator);
        setState(() {
          display = "$display\n$solved";
          firstNumber = solved;
          secondNumber = null;
          operator = "";
        });
      }
      catch (e) {
        setState(() {
          display = "Error";
        });
      }
    }
    else if(firstNumber == piValue){
      setState(() {
        display = "$piValue";
      });
    }
    else if(firstNumber == eValue){
      setState(() {
        display = "$eValue";
      });
    }
    else if(firstNumber == randomValue){
      setState(() {
        display = "$randomValue";
      });
    }
  }

  void clearDisplay() {
    setState(() {
      display = "";
      operator = "";
      firstNumber = null;
      secondNumber = null;
    });
  }

  void delete(){
    var del = display.substring(0,display.length - 1);
    setState(() {
      display = del;
    });
  }

  // Switch to inverse values on buttons
  void inverseValues(){
    setState(() {
      display = "";
      isNatural = !isNatural;
    });
  }

  void buttonsCallback(String btn){
    if (btn == "AC") { clearDisplay(); }
    else if(btn == "DEL") { delete(); }
    else if ('''+-x/ sqrt sin cos tan log ln (-) ! ( ) % $squareOf $cubeOf 
    $tenRaiseToNumerator $sinInverse $cosInverse $tanInverse '''.contains(btn))
    { operatorPressed(btn); }
    else if (btn == raiseToPower) {raiseToPowerPressed(btn, secondNumber);}
    else if ("=".contains(btn)) { equalsPressed(); }
    else if ("Pi Ran e".contains(btn)) { valuePressed(btn); }
    else if (btn == "2nd") { inverseValues();}
    else if ("Mr Mc M+ M-".contains(btn)) { memoryActions(btn); }
    else { numberPressed(btn); }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Calculator App"),
      ),
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            DetailsScreen(details: display),
            ButtonsView(buttonCallback: buttonsCallback, isInverse: isNatural),
          ],
        ),
      ),
    );
  }
}