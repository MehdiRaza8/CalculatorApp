import 'package:calculator_app/color.dart';
import 'package:calculator_app/components/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: const TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      Text(
                        answer.toString(),
                        style: const TextStyle(fontSize: 30, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        WidgetButton(
                          title: 'AC',
                          onPress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        WidgetButton(
                          title: '+/-',
                          onPress: () {
                            userInput += '+/-';
                            setState(() {});
                          },
                        ),
                        WidgetButton(
                          title: '%',
                          onPress: () {
                            userInput += '%';
                            setState(() {});
                          },
                        ),
                        WidgetButton(
                          title: '/',
                          onPress: () {
                            userInput += '/';
                            setState(() {});
                          },
                          color: colororange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        WidgetButton(
                          title: '7',
                          onPress: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                        WidgetButton(
                          title: '8',
                          onPress: () {
                            userInput += '8';
                            setState(() {});
                          },
                        ),
                        WidgetButton(
                          title: '0',
                          onPress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        WidgetButton(
                          title: 'x',
                          onPress: () {
                            userInput += 'x';
                            setState(() {});
                          },
                          color: colororange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        WidgetButton(
                          title: '4',
                          onPress: () {
                            userInput += '4';
                            setState(() {});
                          },
                        ),
                        WidgetButton(
                          title: '5',
                          onPress: () {
                            userInput += '5';
                            setState(() {});
                          },
                        ),
                        WidgetButton(
                          title: '6',
                          onPress: () {
                            userInput += '6';
                            setState(() {});
                          },
                        ),
                        WidgetButton(
                          title: '-',
                          onPress: () {
                            userInput += '-';
                            setState(() {});
                          },
                          color: colororange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        WidgetButton(
                          title: '1',
                          onPress: () {
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                        WidgetButton(
                          title: '2',
                          onPress: () {
                            userInput += '2';
                            setState(() {});
                          },
                        ),
                        WidgetButton(
                          title: '3',
                          onPress: () {
                            userInput += '3';
                            setState(() {});
                          },
                        ),
                        WidgetButton(
                          title: '+',
                          onPress: () {
                            userInput += '+';
                            setState(() {});
                          },
                          color: colororange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        WidgetButton(
                          title: '0',
                          onPress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        WidgetButton(
                          title: '.',
                          onPress: () {
                            userInput += '.';
                            setState(() {});
                          },
                        ),
                        WidgetButton(
                          title: 'DEL',
                          onPress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          },
                        ),
                        WidgetButton(
                          title: '=',
                          onPress: () {
                            equalPress();
                            setState(() {});
                          },
                          color: colororange,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    String finaluserInput = userInput;
    finaluserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finaluserInput);
    ContextModel cm = ContextModel();
    double res = exp.evaluate(EvaluationType.REAL, cm);
    answer = res.toString();
  }
}
