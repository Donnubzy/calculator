
import 'package:calculator/util/styling.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String value;
  final ValueChanged<String> onTap;
  final bool isScientific;
  final Color? color;

  const Button({super.key, required this.value, required this.onTap,
  required this.isScientific, this.color});

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: insets(),
        child: Material(
            color: isScientific ? Colors.black : !isScientific && value == "DEL" ? color
            : !isScientific && value == "AC" ? color : !isScientific && value == "=" ? color
            : Colors.white,
            child: InkWell(
                highlightColor: Colors.grey,
                child: Container(
                    width: size,
                    height: size,
                    decoration: boxDecor(),
                    child: Center(
                        child: Text(value,
                            style: isScientific ? whiteOnBlack() : blackOnWhite()
                        )
                    )
                ),
                onTap: () => onTap(value)
            )
        )
    );
  }
}