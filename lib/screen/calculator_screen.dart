import 'package:calculator/entities/button_value.dart';
import 'package:calculator/utils/color_utils.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double currentResult = 0;
  String currentResultText = "";
  String currentNumber = "";
  String currentOperator = "+";
  
  bool hasDivider = false;
  bool isFinal = false;

  void clear() {
    currentResult = 0;
    currentOperator = "+";

    hasDivider = false;
    isFinal = false;

    setState(() {
      currentResultText = "";
      currentNumber = "";
    });
  }

  void onButtonTap(ButtonValue btnValue) {
    switch (btnValue.type) {
      case ButtonType.number:
        if (isFinal) {
          currentNumber = "";
          currentResultText = "";
        }
        isFinal = false;
        setState(() {
          currentResultText += btnValue.text;
          currentNumber += btnValue.text;
        });
      case ButtonType.divider:
        if (hasDivider || currentNumber.isEmpty) break;
        hasDivider = true;
        setState(() {
          currentResultText += btnValue.text;
          currentNumber += btnValue.text;
        });
      case ButtonType.operator:
        currentResult = calcResult(currentOperator, currentResult, double.parse(currentNumber));
        currentOperator = btnValue.text;
        setState(() {
          currentResultText += btnValue.text;
          currentNumber = "";
        });
        isFinal = false;
        hasDivider = false;
      case ButtonType.controller:
        switch (btnValue.text) {
          case "=":
            isFinal = true;
            currentResult = calcResult(currentOperator, currentResult, double.parse(currentNumber));
            setState(() {
              currentResultText = "$currentResult";
              currentNumber = currentResultText;
            });
            currentResult = 0;
            currentOperator = '+';
          case "D":
            clear();
          case "C":
            if (isFinal) {
              clear();
              break;
            }
            if (currentNumber.isEmpty) break;
            
            setState(() {
              currentNumber = currentNumber.substring(0, currentNumber.length - 1);
              currentResultText = currentResultText.substring(0, currentResultText.length - 1);
            });
        }
    }
  }

  double calcResult(String operator, double firstOperand, double secondOperand) {
    switch (operator) {
      case "+":
        return firstOperand + secondOperand;
      case "-":
        return firstOperand - secondOperand;
      case "÷":
        return firstOperand / secondOperand;
      case "x":
        return firstOperand * secondOperand;
      case "%":
        return firstOperand % secondOperand;
      default:
        return firstOperand;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: SingleChildScrollView(
              reverse: true,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  currentResultText.isEmpty ? "0" : currentResultText, 
                  style: const TextStyle(
                    color: Colors.grey, 
                    fontSize: 30
                  )
                ),
              ),
            )),
            Container(
              alignment: Alignment.bottomRight,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: 
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        currentNumber.isEmpty ? "0" : currentNumber,
                        style: const TextStyle(
                          color: Colors.white, 
                          fontWeight: FontWeight.bold, 
                          fontSize: 50
                        )
                      ),
                    )
                  ,
                ),
              ),
            ),
            Wrap(
              children: ButtonValue.values.map((btnValue) => SizedBox(
                width: screenSize.width / btnValue.size,
                height: screenSize.width / 5,
                child: buildButton(btnValue)
              )).toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton(ButtonValue btnValue) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: ColorUtils.getColor(btnValue.color, context),
        textStyle: const TextStyle(color: Colors.white),
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Colors.black54
          )
        ),
        child: InkWell(
          onTap: () => onButtonTap(btnValue),
          child: Center(
            child: Text(
              btnValue.text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            )
          )
        )
      ),
    );
  }
}