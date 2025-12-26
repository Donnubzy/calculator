
import 'package:calculator/model/provider.dart';
import 'package:calculator/util/styling.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  final String value;
  final bool isScientific;
  const Button({super.key, required this.value, required this.isScientific});

  @override
  Widget build(BuildContext context) {
    final reader = context.read<CalculatorModel>();

    return Padding(
        padding: insets(),
        child: Material(
            color: isScientific ? Colors.black
                : !isScientific && value == "DEL" ? Colors.red
                : !isScientific && value == "AC" ? Colors.orange
                : !isScientific && value == "=" ? Colors.green.shade500
                : Colors.white,
            child: InkWell(
                highlightColor: Colors.grey,
                child: Container(
                    width: size,
                    height: size,
                    decoration: boxDecor(),
                    child: Center(
                        child: Text(
                            value,
                            style: isScientific ? whiteOnBlack() : blackOnWhite()
                        )
                    )
                ),
                onTap: () => reader.buttonsCallback(value)
            )
        )
    );
  }
}