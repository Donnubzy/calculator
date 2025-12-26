
import 'package:calculator/model/provider.dart';
import 'package:calculator/ui/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:calculator/util/styling.dart';
import 'package:provider/provider.dart';

class ButtonsView extends StatelessWidget {
  const ButtonsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isInverse = context.watch<CalculatorModel>().isNatural;

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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(value: "Mr", isScientific: true),
                        Button(value: "Mc", isScientific: true),
                        Button(value: "<=", isScientific: true),
                        Button(value: "=>", isScientific: true),
                        Button(value: "M+", isScientific: true),
                        Button(value: "M-", isScientific: true),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(value: "sqrt", isScientific: true),
                        Button(value: squareOf, isScientific: true),
                        Button(value: cubeOf, isScientific: true),
                        Button(value: raiseToPower, isScientific: true),
                        Button(value: "log", isScientific: true),
                        Button(value: "ln", isScientific: true),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Button(value: "!", isScientific: true),
                        const Button(value: "Pi", isScientific: true),
                        const Button(value: "e", isScientific: true),
                        Button(value: isInverse ? sinInverse : "sin" ,
                            isScientific: true),
                        Button(value: isInverse ? cosInverse : "cos",
                            isScientific: true),
                        Button(value: isInverse ? tanInverse : "tan",
                            isScientific: true),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(value: "2nd", isScientific: true),
                        Button(value: "(-)", isScientific: true),
                        Button(value: "(", isScientific: true),
                        Button(value: ")", isScientific: true),
                        Button(value: "%", isScientific: true),
                        Button(value: "Ran", isScientific: true),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(value: "7", isScientific: false),
                        Button(value: "8", isScientific: false),
                        Button(value: "9", isScientific: false),
                        Button(value: "DEL", isScientific: false),
                        Button(value: "AC", isScientific: false),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(value: "4", isScientific: false),
                        Button(value: "5", isScientific: false),
                        Button(value: "6", isScientific: false),
                        Button(value: "×", isScientific: false),
                        Button(value: "÷", isScientific: false),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(value: "1", isScientific: false),
                        Button(value: "2", isScientific: false),
                        Button(value: "3", isScientific: false),
                        Button(value: "+", isScientific: false),
                        Button(value: "-", isScientific: false),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(value: "0", isScientific: false),
                        Button(value: ".", isScientific: false),
                        Button(value: tenRaiseToNumerator, isScientific: false),
                        Button(value: "Ans", isScientific: false),
                        Button(value: "=", isScientific: false),
                      ],
                    )
                  ],
                )
            )
        )
    );
  }
}
