import 'package:flutter/material.dart';
import 'calculator.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Calculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}
