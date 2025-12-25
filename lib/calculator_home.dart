
import 'package:calculator/model/provider.dart';
import 'package:calculator/util/styling.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/calc_logic.dart';
import 'package:calculator/ui/views/details_screen.dart';
import 'package:calculator/ui/views/buttons_view.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    var read = context.read<CalculatorModel>();
    var watch = context.read<CalculatorModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Calculator App"),
      ),
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            DetailsScreen(
                details: watch.display
            ),
            ButtonsView(
                buttonCallback: read.buttonsCallback,
                isInverse: watch.isNatural
            ),
          ],
        ),
      ),
    );
  }
}