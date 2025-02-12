import 'package:flutter/material.dart';
import 'package:ui_practice/widgets/CalculatorButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _input = "";
  String operand = "";
  double num1 = 0;
  double num2 = 0;

  void buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        _output = "";
        _input = "";
        operand = "";
        num1 = 0;
        num2 = 0;
      } else if (value == "=") {
        num2 = double.parse(_input);
        if (operand == "+") {
          _output = (num1 + num2).toString();
        }
        if (operand == "-") {
          _output = (num1 - num2).toString();
        }
        if (operand == "x") {
          _output = (num1 * num2).toString();
        }
        if (operand == "÷") {
          _output = num2 != 0 ? (num1 / num2).toString() : "error";
        }
        _input = _output;
      } else if (["+", "÷", "x", "-"].contains(value)) {
        num1 = double.parse(_input);
        operand = value;
        _input = "";
        _output += " $operand ";
      } else {
          _input += value;
          _output = _input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Calculator",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Text(
                _output,
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: [
              CalculatorButton(name: '7', onclick: () => buttonPressed("7")),
              CalculatorButton(name: '8', onclick: () => buttonPressed("8")),
              CalculatorButton(name: '9', onclick: () => buttonPressed("9")),
              CalculatorButton(
                name: '÷',
                onclick: () => buttonPressed('÷'),
                color: Colors.orange,
              )
            ],
          ),
          Row(
            children: [
              CalculatorButton(name: '4', onclick: () => buttonPressed("4")),
              CalculatorButton(name: '5', onclick: () => buttonPressed("5")),
              CalculatorButton(name: '6', onclick: () => buttonPressed("6")),
              CalculatorButton(
                name: 'x',
                onclick: () => buttonPressed('x'),
                color: Colors.orange,
              )
            ],
          ),
          Row(
            children: [
              CalculatorButton(name: '1', onclick: () => buttonPressed("1")),
              CalculatorButton(name: '2', onclick: () => buttonPressed("2")),
              CalculatorButton(name: '3', onclick: () => buttonPressed("3")),
              CalculatorButton(
                name: '-',
                onclick: () => buttonPressed('-'),
                color: Colors.orange,
              )
            ],
          ),
          Row(
            children: [
              CalculatorButton(
                name: 'C',
                onclick: () => buttonPressed("C"),
                color: Colors.red,
              ),
              CalculatorButton(name: '0', onclick: () => buttonPressed("0")),
              CalculatorButton(
                  name: '=',
                  onclick: () => buttonPressed("="),
                  color: Colors.green),
              CalculatorButton(
                name: '+',
                onclick: () => buttonPressed('+'),
                color: Colors.orange,
              )
            ],
          ),
        ],
      ),
    );
  }
}
