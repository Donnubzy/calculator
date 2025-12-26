
import 'package:calculator/model/provider.dart';
import 'package:calculator/util/styling.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final watcher = context.watch<CalculatorModel>();

    return Padding(
        padding: insets(),
        child: Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Center(
                child: Text(
                    watcher.display,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20
                    )
                )
            )
        )
    );
  }
}
