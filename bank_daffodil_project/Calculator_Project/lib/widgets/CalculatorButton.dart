import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  String name;
  Color? color;
  final VoidCallback onclick;

  CalculatorButton(
      {super.key, required this.name, this.color, required this.onclick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey[800],
            padding: EdgeInsets.all(25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10),),
            ),
          ),
          onPressed: onclick,
          child: Text(
            name, style: TextStyle(fontSize: 24, color: Colors.white),),),
      ),
    );
  }
}
