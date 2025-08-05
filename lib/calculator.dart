import 'package:flutter/material.dart';
import 'widgets/calculator_display.dart';
import 'widgets/calculator_buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _input = '';
  String _result = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _input = '';
        _result = '';
      } else if (value == '⌫') {
        if (_input.isNotEmpty) {
          _input = _input.substring(0, _input.length - 1);
        }
      } else if (value == '=') {
        try {
          _result = _evaluateExpression(_input);
        } catch (_) {
          _result = 'Error';
        }
      } else {
        _input += value;
      }
    });
  }

  String _evaluateExpression(String expression) {
    try {
      ShuntingYardParser parser = ShuntingYardParser();
      Expression exp = parser.parse(
        expression.replaceAll('×', '*').replaceAll('÷', '/'),
      );
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      return eval.toString();
    } catch (_) {
      return 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CalculatorDisplay(input: _input, result: _result),
          CalculatorButtons(onPressed: _onButtonPressed),
        ],
      ),
    );
  }
}
