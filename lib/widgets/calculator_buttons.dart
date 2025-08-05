  import 'package:flutter/material.dart';
  import 'calculator_button.dart';

  class CalculatorButtons extends StatelessWidget {
    final void Function(String) onPressed;

    const CalculatorButtons({required this.onPressed});

    @override
    Widget build(BuildContext context) {
      final buttons = [
        ['C', '⌫', '%', '÷'],
        ['7', '8', '9', '×'],
        ['4', '5', '6', '-'],
        ['1', '2', '3', '+'],
        ['0', '.', '=',],
      ];

      return Column(
        children: buttons.map((row) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: row.map((btnText) {
              return CalculatorButton(
                text: btnText,
                onTap: () => onPressed(btnText),
                flex: btnText == '0' ? 2 : 1,
                color: _getColor(btnText),
              );
            }).toList(),
          );
        }).toList(),
      );
    }

    Color _getColor(String text) {
      if (text == 'C' || text == '⌫') return Colors.redAccent;
      if (text == '=' || ['+', '-', '×', '÷'].contains(text)) return Colors.orange;
      return Colors.grey.shade800;
    }
  }
