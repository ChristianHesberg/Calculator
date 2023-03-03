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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(children: [
                          _getButton("7"),
                          _getButton("8"),
                          _getButton("9"),
                          _getCommandButton("+")
                        ]),
                        Row(children: [
                          _getButton("4"),
                          _getButton("5"),
                          _getButton("6"),
                          _getCommandButton("-")
                        ]),
                        Row(children: [
                          _getButton("1"),
                          _getButton("2"),
                          _getButton("3"),
                          _getCommandButton("*")
                        ]),
                        Row(children: [
                          _getButton("0"),
                          _getButton("00"),
                          _getButton("."),
                          _getCommandButton("/")
                        ]),
                        Row(
                          children: _getMiscCommands(),
                        )
                      ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _getButton(String number) {
    return Container(
      margin: EdgeInsets.all(5),
      child: SizedBox(
        width: 85,
        height: 70,
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                firstField = firstField + number;
              });
            },
            child: Text(number)),
      ),
    );
  }

  Container _getCommandButton(String command) {
    Command? calcCommand = calculator.commands[command];
    return Container(
      margin: EdgeInsets.all(5),
      child: SizedBox(
        width: 85,
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              if (calcCommand != null) {
                firstField =
                    calcCommand.calculate(calculator, firstField).toString();
              }
            });
          },
          child: Text(command),
        ),
      ),
    );
  }

  List<Container> _getMiscCommands() {
    List<Container> commandButtons = [];

    commandButtons.add(Container(
      margin: EdgeInsets.all(5),
      child: SizedBox(
        width: 85,
        height: 70,
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                if (firstField.length > 0) {
                  firstField = firstField.substring(0, firstField.length - 1);
                }
              });
            },
            child: Text("DEL")),
      ),
    ));
    commandButtons.add(Container(
      margin: EdgeInsets.all(5),
      child: SizedBox(
        width: 85,
        height: 70,
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                firstField = "";
                calculator.clear();
              });
            },
            child: Text("CLEAR")),
      ),
    ));
    commandButtons.add(Container(
      margin: EdgeInsets.all(5),
      child: SizedBox(
        width: 85,
        height: 70,
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                calculator.push(double.parse(firstField));
                firstField = "";
              });
            },
            child: Text("ENTER")),
      ),
    ));
    return commandButtons;
  }
}
