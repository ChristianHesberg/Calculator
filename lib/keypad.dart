import 'package:calculator/button_grid.dart';
import 'package:calculator/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Keypad extends StatelessWidget {
  const Keypad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculatorModel>(context);
    return ButtonGrid([
      [
        ButtonDef("DEL", () => provider.remove()),
        ButtonDef("Clear", () => provider.clear()),
        ButtonDef(""),
        ButtonDef("+", () => provider.execute("+"))
      ],
      [
        ButtonDef("7", () => provider.addDigit(7)),
        ButtonDef("8", () => provider.addDigit(8)),
        ButtonDef("9", () => provider.addDigit(9)),
        ButtonDef("-", () => provider.execute("-")),
      ],
      [
        ButtonDef("4", () => provider.addDigit(4)),
        ButtonDef("5", () => provider.addDigit(5)),
        ButtonDef("6", () => provider.addDigit(6)),
        ButtonDef("/", () => provider.execute("/")),
      ],
      [
        ButtonDef("1", () => provider.addDigit(1)),
        ButtonDef("2", () => provider.addDigit(2)),
        ButtonDef("3", () => provider.addDigit(3)),
        ButtonDef("*", () => provider.execute("*")),
      ],
      [
        ButtonDef(""),
        ButtonDef("0", () => provider.addDigit(0)),
        ButtonDef(".", () => provider.addDecimal()),
        ButtonDef("Enter", () => provider.enter()),
      ],

    ]);
  }
}
