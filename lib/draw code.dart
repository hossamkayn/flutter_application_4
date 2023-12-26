import 'package:flutter/material.dart';

  runApp(CodeDrawerApp());
}

class CodeDrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Drawer',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: CodeDrawerScreen(),
    );
  }
}

class CodeDrawerScreen extends StatefulWidget {
  @override
  _CodeDrawerScreenState createState() => _CodeDrawerScreenState();
}

class _CodeDrawerScreenState extends State<CodeDrawerScreen> {
  TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Code Drawer'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _codeController,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Enter the code',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String code = _codeController.text;
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Code Drawer'),
                      content: SingleChildScrollView(
                        child: Text(
                          code,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Draw Code'),
            ),
          ],
        ),
      ),
    );
  }
}
