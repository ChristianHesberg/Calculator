import 'package:calculator/calculator_model.dart';
import 'package:calculator/display.dart';
import 'package:calculator/keypad.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<CalculatorModel>(
          create: (context) => CalculatorModel(),
          child: const HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 1,
            // Consumes state
            child: Display(),
          ),
          Flexible(
            flex: 2,
            // Changes state
            child: Keypad(),
          ),
        ],
      ),
    );
  }
}

