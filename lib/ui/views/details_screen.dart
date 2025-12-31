
import 'package:calculator/util/styling.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String details;
  const DetailsScreen({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
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
                child: Text(details,
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
