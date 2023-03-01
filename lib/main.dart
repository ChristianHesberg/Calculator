import 'dart:ffi';

import 'package:calculator/calculator.dart';
import 'package:calculator/commands.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Calculator calculator = Calculator();
  var firstField = "";
  var secondField = "";
  var thirdField = "";

  final List<String> buttons = [
    'C',
    'DEL',
    '',
    '+',
    '7',
    '8',
    '9',
    '-',
    '4',
    '5',
    '6',
    '*',
    '1',
    '2',
    '3',
    '/',
    '0',
    '.',
    '',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    secondField = calculator.getElementByIndex(0).toString();
    thirdField = calculator.getElementByIndex(1).toString();


    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: [
          FittedBox(
            fit: BoxFit.fill,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      thirdField,
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.centerRight,
                    child: Text(
                      secondField,
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.centerRight,
                    child: Text(
                      firstField,
                      style: TextStyle(fontSize: 30, color: Colors.lightBlue),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: GridView.count(
                            crossAxisCount: 3,
                            children: _getNumbers(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 590,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: _getCommands(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  List<ElevatedButton> _getNumbers() {
    List<ElevatedButton> buttons = List.generate(
        9,
            (index) => ElevatedButton(
            onPressed: () {
              setState(() {
                firstField =
                    firstField + (index+1).toString();
              });
            },
            child: Text("${index+1}"))
    );
    buttons.add(ElevatedButton(
        onPressed: () {
          setState(() {
            firstField =
                firstField + 0.toString();
          });
        },
        child: Text("0")));

    return buttons;
  }

  List<ElevatedButton> _getCommands(){

    Iterable<String> keys = calculator.commands.keys;
    Iterable<Command> commands = calculator.commands.values;

    List<ElevatedButton> commandButtons = List.generate(
        calculator.commands.length,
            (index) => ElevatedButton(
                onPressed: () {
                  setState(() {
                    firstField = commands
                        .elementAt(index)
                        .calculate(calculator, firstField)
                        .toString();
                  });
                },
                child: Text(keys.elementAt(index)))
    );
    commandButtons.add(ElevatedButton(
        onPressed: () {
          setState(() {
            calculator.push(double.parse(firstField));
            firstField ="";
          });
        },
        child: Text("ENTER")));
    commandButtons.add(ElevatedButton(
        onPressed: () {
          setState(() {
            if(firstField.length > 0){
              firstField =
                  firstField.substring(0, firstField.length - 1);
            }
          });
        },
        child: Text("DEL")));
    commandButtons.add(ElevatedButton(
        onPressed: () {
          setState(() {
            firstField ="";
            calculator.clear();
          });
        },
        child: Text("CLEAR")));
    return commandButtons;
  }
}
