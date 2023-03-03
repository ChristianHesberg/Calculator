import 'calculator.dart';

abstract class Command{
  double calculate(Calculator calc, String input);
}

class Add extends Command{
  @override
  calculate(Calculator calc, String input) {
    double first = calc.pop();
    return first + double.parse(input);
  }
}

class Subtract extends Command{
  @override
  double calculate(Calculator calc, String input) {
    double first = calc.pop();
    return first - double.parse(input);
  }
}

class Multiply extends Command{
  @override
  double calculate(Calculator calc, String input) {
    double first = calc.pop();
    return first * double.parse(input);
  }
}

class Divide extends Command{
  @override
  double calculate(Calculator calc, String input) {
    double first = calc.pop();
    return first / double.parse(input);
  }
}

