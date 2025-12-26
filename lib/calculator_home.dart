

import 'package:flutter/material.dart';
import 'package:calculator/ui/views/details_screen.dart';
import 'package:calculator/ui/views/buttons_view.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Calculator App"),
      ),
      backgroundColor: Colors.grey.shade50,
      body: const SafeArea(
        child: Column(
          children: <Widget>[
            DetailsScreen(),
            ButtonsView(),
          ],
        ),
      ),
    );
  }
}