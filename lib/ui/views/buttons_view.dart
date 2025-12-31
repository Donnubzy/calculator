
import 'package:calculator/ui/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:calculator/util/styling.dart';

class ButtonsView extends StatelessWidget {
  final ValueChanged<String> buttonCallback;
  final bool isInverse;
  const ButtonsView({super.key, required this.buttonCallback,
    required this.isInverse});

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: insets(),
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 450,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: const BorderRadius.all(Radius.circular(7))
            ),
            child: Padding(
                padding: insets(),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(value: "Mr", onTap: buttonCallback, isScientific: true),
                        Button(value: "Mc", onTap: buttonCallback, isScientific: true),
                        Button(value: "<=", onTap: buttonCallback, isScientific: true),
                        Button(value: "=>", onTap: buttonCallback, isScientific: true),
                        Button(value: "M+", onTap: buttonCallback, isScientific: true),
                        Button(value: "M-", onTap: buttonCallback, isScientific: true),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(value: "sqrt", onTap: buttonCallback, isScientific: true),
                        Button(value: squareOf, onTap: buttonCallback, isScientific: true),
                        Button(value: cubeOf, onTap: buttonCallback, isScientific: true),
                        Button(value: raiseToPower, onTap: buttonCallback, isScientific: true),
                        Button(value: "log", onTap: buttonCallback, isScientific: true),
                        Button(value: "ln", onTap: buttonCallback, isScientific: true),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(value: "!", onTap: buttonCallback, isScientific: true),
                        Button(value: "Pi", onTap: buttonCallback, isScientific: true),
                        Button(value: "e", onTap: buttonCallback, isScientific: true),
                        Button(value: isInverse ? sinInverse : "sin" ,
                            onTap: buttonCallback, isScientific: true),
                        Button(value: isInverse ? cosInverse : "cos",
                            onTap: buttonCallback, isScientific: true),
                        Button(value: isInverse ? tanInverse : "tan",
                            onTap: buttonCallback, isScientific: true),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(value: "2nd", onTap: buttonCallback, isScientific: true),
                        Button(value: "(-)", onTap: buttonCallback, isScientific: true),
                        Button(value: "(", onTap: buttonCallback, isScientific: true),
                        Button(value: ")", onTap: buttonCallback, isScientific: true),
                        Button(value: "%", onTap: buttonCallback, isScientific: true),
                        Button(value: "Ran", onTap: buttonCallback, isScientific: true),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(value: "7", onTap: buttonCallback, isScientific: false),
                        Button(value: "8", onTap: buttonCallback, isScientific: false),
                        Button(value: "9", onTap: buttonCallback, isScientific: false),
                        Button(value: "DEL", onTap: buttonCallback, isScientific: false,
                          color: Colors.orange,),
                        Button(value: "AC", onTap: buttonCallback, isScientific: false,
                          color: Colors.orange,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(value: "4", onTap: buttonCallback, isScientific: false),
                        Button(value: "5", onTap: buttonCallback, isScientific: false),
                        Button(value: "6", onTap: buttonCallback, isScientific: false),
                        Button(value: "x", onTap: buttonCallback, isScientific: false),
                        Button(value: "/", onTap: buttonCallback, isScientific: false),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(value: "1", onTap: buttonCallback, isScientific: false),
                        Button(value: "2", onTap: buttonCallback, isScientific: false),
                        Button(value: "3", onTap: buttonCallback, isScientific: false),
                        Button(value: "+", onTap: buttonCallback, isScientific: false),
                        Button(value: "-", onTap: buttonCallback, isScientific: false),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(value: "0", onTap: buttonCallback, isScientific: false),
                        Button(value: ".", onTap: buttonCallback, isScientific: false),
                        Button(value: tenRaiseToNumerator, onTap: buttonCallback, isScientific: false),
                        Button(value: "Ans", onTap: buttonCallback, isScientific: false),
                        Button(value: "=", onTap: buttonCallback, isScientific: false,
                          color: Colors.green.shade500,),
                      ],
                    )
                  ],
                )
            )
        )
    );
  }
}
