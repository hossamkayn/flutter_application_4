import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController numberController = TextEditingController();
  TextEditingController limitController = TextEditingController();
  String result = '';

  List<int> findMultiples(int number, int limit) {
    List<int> multiples = [];
    for (int i = 1; i <= limit; i++) {
      if (number % i == 0) {
        multiples.add(i);
      }
    }
    return multiples;
  }

  int convertNegative(int number) {
    return number.abs();
  }

  void clearResult() {
    setState(() {
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Center(child: Text('Calculator')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter a number',
              ),
            ),
            TextField(
              controller: limitController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter a limit of namber',
              ),
            ),
            SizedBox(height: 18),
            ElevatedButton(
              onPressed: () {
                int number = int.parse(numberController.text);
                int limit = int.parse(limitController.text);
                List<int> multiples = findMultiples(number, limit);
                setState(() {
                  result = 'Multiples are: $multiples';
                });
              },
              child: Text('Find Multiples'),
            ),
            ElevatedButton(
              onPressed: () {
                int number = int.parse(numberController.text);
                int convertedNumber = convertNegative(number);
                setState(() {
                  result = 'Converted Number: $convertedNumber';
                });
              },
              child: Text('Convert to Positive'),
            ),
            ElevatedButton(
              onPressed: () {
                clearResult();
              },
              child: Text('Clear Result'),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
