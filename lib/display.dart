import 'package:calculator/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Display extends StatelessWidget {
  const Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculatorModel>(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("${provider.calculator.getStack}", textAlign: TextAlign.right,
              style: TextStyle(fontSize: 30)),
          Text(provider.number,
              textAlign: TextAlign.right, style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}
