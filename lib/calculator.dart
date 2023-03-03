import 'package:calculator/commands.dart';

class Calculator{
  final List<double> _stack = [];
  final Map<String, Command> commands = {
    "+" : Add(),
    "-" : Subtract(),
    "*" : Multiply(),
    "/" : Divide(),
  };

  void push(double value) => _stack.add(value);
  double pop() => _stack.isNotEmpty ? _stack.removeLast(): 0;
  void clear() => _stack.clear();
  double getElementByIndex(int index) => _stack.length > index ? _stack[_stack.length-index-1] : 0;


}