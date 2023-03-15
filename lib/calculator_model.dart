import 'package:calculator/calculator.dart';
import 'package:calculator/commands.dart';
import 'package:flutter/cupertino.dart';

class CalculatorModel extends ChangeNotifier{
  Calculator calculator = Calculator();
  String number = "";

  clear(){
    number = "";
    notifyListeners();
  }

  remove(){
    if(number.isEmpty) return;
    number = number.substring(0, number.length - 1);
    notifyListeners();
  }

  addDecimal() {
    number = "$number.";
    notifyListeners();
  }

  addDigit(int digit) {
    final newNumber = "$number$digit";
    if (num.tryParse(newNumber) == null) return;
    number = newNumber;
    notifyListeners();
  }

  enter() {
    if(double.tryParse(number) != null){
      calculator.push(double.parse(number));
      notifyListeners();
    }
  }

  execute(String command){
    Command? calcCommand = calculator.commands[command];
    if(calcCommand!=null){
      number = calcCommand.calculate(calculator, number).toString();
      notifyListeners();
    }
  }
}