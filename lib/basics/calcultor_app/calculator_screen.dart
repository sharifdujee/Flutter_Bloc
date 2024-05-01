import 'package:flutter/material.dart';
import 'package:flutter_roadmap/basics/calcultor_app/components/calculator_components.dart';
import 'package:math_expressions/math_expressions.dart';


class CalculatorApps extends StatefulWidget {
  static const String routeName = '/calculator';
  const CalculatorApps({super.key});

  @override
  State<CalculatorApps> createState() => _CalculatorAppsState();
}

class _CalculatorAppsState extends State<CalculatorApps> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Calculator Apps'),
      ),
      // backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
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
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          answer.toString(),
                          style: const TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CalculatorButton(
                            title: 'Ac',
                            onPress: () {
                              userInput = '';
                              answer = '';
                              setState(() {});
                            },
                          ),
                          CalculatorButton(
                            title: '+/-',
                            onPress: () {
                              userInput += '+/-';
                              setState(() {});
                            },
                          ),
                          CalculatorButton(
                            title: '%',
                            onPress: () {
                              userInput += '%';
                              setState(() {});
                            },
                          ),
                          CalculatorButton(
                            title: '/',
                            onPress: () {
                              userInput +=    '/';
                              setState(() {

                              });
                            },
                            color: const Color(0xffffa00a),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CalculatorButton(
                            title: '7',
                            onPress: () {
                              userInput += '7';
                              setState(() {});
                            },
                          ),
                          CalculatorButton(
                            title: '8',
                            onPress: () {
                              userInput += '8';
                              setState(() {});
                            },
                          ),
                          CalculatorButton(
                            title: '9',
                            onPress: () {
                              userInput += '9';
                              setState(() {});
                            },
                          ),
                          CalculatorButton(
                            title: 'x',
                            onPress: () {
                              userInput +=    'x';
                              setState(() {

                              });
                            },
                            color: const Color(0xffffa00a),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CalculatorButton(
                            title: '4',
                            onPress: () {
                              userInput += '4';
                              setState(() {});
                            },
                          ),
                          CalculatorButton(
                            title: '5',
                            onPress: () {
                              userInput += '5';
                              setState(() {});
                            },
                          ),
                          CalculatorButton(
                            title: '6',
                            onPress: () {
                              userInput += '6';
                              setState(() {});
                            },
                          ),
                          CalculatorButton(
                            title: '-',
                            onPress: () {
                              userInput +=    '-';
                              setState(() {

                              });
                            },
                            color: const Color(0xffffa00a),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CalculatorButton(
                            title: '1',
                            onPress: () {
                              userInput += '1';
                              setState(() {});
                            },
                          ),
                          CalculatorButton(
                            title: '2',
                            onPress: () {
                              userInput += '2';
                              setState(() {});
                            },
                          ),
                          CalculatorButton(
                            title: '3',
                            onPress: () {
                              userInput += '3';
                              setState(() {});
                            },
                          ),
                          CalculatorButton(
                            title: '+',
                            onPress: () {
                              userInput +=    '+';
                              setState(() {

                              });
                            },
                            color: const Color(0xffffa00a),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CalculatorButton(
                            title: '0',
                            onPress: () {
                              userInput +=    '0';
                              setState(() {

                              });
                            },
                          ),
                          CalculatorButton(
                            title: '.',
                            onPress: () {
                              userInput +=    '.';
                              setState(() {

                              });
                            },
                          ),
                          CalculatorButton(
                            title: 'DEL',
                            onPress: () {
                              userInput = userInput.substring(0, userInput.length-1);
                              setState(() {

                              });
                            },
                          ),
                          CalculatorButton(
                            title: '=',
                            onPress: () {
                              _equalPress();
                              setState(() {

                              });
                            },
                            color: const Color(0xffffa00a),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /*MyButton(title: 'Login'),
                MyButton(title: 'Singup',),*/
                /* CalculatorButton(),
                CalculatorButton(),*/

                /*Text(
                  'Md Sharif Hossain',
                  style: headingTextStyle,
                ),
                Text(
                  'Md Sharif Hossain',
                  style: TextStyle(fontSize: 30, color: greenColor),
                ),
                Text(
                  'Md Sharif Hossain',
                  style: TextStyle(fontSize: 30, color: blueColor),
                ),
                Text(
                  'Md Sharif Hossain',
                  style: TextStyle(fontSize: 30, color: Colors.grey),
                ),
                Text(
                  'Md Sharif Hossain',
                  style: TextStyle(fontSize: 30, color: Colors.grey),
                ),*/
                /*Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  height: 50,

                  child: Center(child: Text('Login',
                  style: buttonTextStyle,
                  )),
                ),
                const SizedBox(
                  height: 10,
                ),*/
                /*  Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  height: 50,

                  child: Center(child: Text('Signup',
                  style: buttonTextStyle,)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  height: 50,

                  child: Center(child: Text('Verify',
                  style: buttonTextStyle,)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  height: 50,

                  child: Center(child: Text('Continue',
                  style: buttonTextStyle,)),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _equalPress(){
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double eval =  expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();

  }
}
