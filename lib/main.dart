
import 'package:calculator/calculator_home.dart';
import 'package:calculator/model/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (_) => CalculatorModel(),
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       themeMode: ThemeMode.system,
       home: const Calculator(),
    );
  }
}
