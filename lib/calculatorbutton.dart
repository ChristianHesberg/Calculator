import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {

  final String text;
  final String field;

  const CalculatorButton({
    Key? key,
    required this.text,
    required this.field
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: SizedBox(
        width: 85,
        height: 70,
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                firstField = firstField + (index + 1).toString();
              });
            },
            child: Text("${index + offset}")),
      ),
    );
  }
}
