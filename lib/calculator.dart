import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

void main() => runApp(const RunMyApp());

class RunMyApp extends StatelessWidget {
  const RunMyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // materialApp with debugbanner false
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan), // default theme
      home: Scaffold(
        // scaffold allows set appbar and it title
        appBar: AppBar(
          title: const Text('goldCalculator'),
        ),
        body: SizedBox(
          width: double.infinity, // width of the sizedbox.
          child: Calc(), // sizedbox taking class Calc
        ),
      ),
    );
  }
}

class Calc extends StatefulWidget {
  const Calc({Key? key}) : super(key: key);

  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  double? _currentValue = 0; // Variable that holds the any changes in the calc
  @override
  Widget build(BuildContext context) {
    var calc = SimpleCalculator(
      // SimpleCalculator widget to allow us to set it parameters
      value: _currentValue!, // value is to currentValue
      hideExpression: false,
      hideSurroundingBorder: true,
      autofocus: true,
      onChanged: (key, value, expression) {
        setState(() {
          // setState method call everytime when every changes occur
          _currentValue = value ?? 0;
        });
      },
      theme: const CalculatorThemeData(
        // setting the theme of the calculator
        borderColor: Colors.black,
        borderWidth: 2,
        displayColor: Colors.black54,
        displayStyle:
            TextStyle(fontSize: 80, color: Color.fromARGB(255, 218, 21, 18)),
        expressionColor: Colors.indigo,
        expressionStyle: TextStyle(fontSize: 20, color: Colors.white),
        operatorColor: Color.fromARGB(255, 148, 121, 23),
        operatorStyle: TextStyle(fontSize: 30, color: Colors.white),
        commandColor: Color.fromARGB(255, 120, 18, 103),
        commandStyle: TextStyle(fontSize: 30, color: Colors.white),
        numColor: Color.fromARGB(255, 93, 28, 28),
        numStyle: TextStyle(fontSize: 50, color: Colors.white),
      ),
    );
    return SafeArea(child: calc); // showing the calculator
  }
}
