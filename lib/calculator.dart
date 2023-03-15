import 'package:calculator/commands.dart';

class Calculator{
  final List<double> stack = [];
  final Map<String, Command> commands = {
    "+" : Add(),
    "-" : Subtract(),
    "*" : Multiply(),
    "/" : Divide(),
  };

  void push(double value) => stack.add(value);
  double pop() => stack.isNotEmpty ? stack.removeLast(): 0;
  void clear() => stack.clear();
  double getElementByIndex(int index) => stack.length > index ? stack[stack.length-index-1] : 0;
  List<double> get getStack => stack;
}
