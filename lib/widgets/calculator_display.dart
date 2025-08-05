import 'package:flutter/material.dart';

class CalculatorDisplay extends StatelessWidget {
  final String input;
  final String result;

  const CalculatorDisplay({required this.input, required this.result});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        alignment: Alignment.bottomRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(input, style: TextStyle(fontSize: 32, color: Colors.white70)),
            SizedBox(height: 10),
            Text(result, style: TextStyle(fontSize: 48, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
