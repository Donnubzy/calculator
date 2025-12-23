
import 'package:flutter/material.dart';

// Padding
EdgeInsetsGeometry insets() {
  return const EdgeInsets.all(8.0);
}

// TextStyle
TextStyle whiteOnBlack() {
  return const TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.bold
  );
}

TextStyle blackOnWhite() {
  return const TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.bold
  );
}

// Box Decoration
BoxDecoration boxDecor(){
  return BoxDecoration(
      borderRadius: BorderRadius.circular(4)
  );
}

// Size
double size = 35.0;

// Local variables
const String squareOf = "  ii\n^";
const String cubeOf = "  iii\n^";
const String raiseToPower = "  n\n^";
const String tenRaiseToNumerator = "   x\n|O";
const String sinInverse = "asin";
const String cosInverse = "acos";
const String tanInverse = "atan";