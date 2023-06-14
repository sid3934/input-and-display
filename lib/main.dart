import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrieve Text Input',
      home: HomePage(),
    );
  }
}

// Define a custom Form widget.
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _HomePageState extends State<HomePage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  dynamic _inputtext;
  void _newtext() {
    setState(() {
      _inputtext = (myController.text);
    });
  }

  List<Color> colors = [
    const Color(0xffb74093),
    const Color.fromARGB(125, 75, 45, 82),
    const Color.fromARGB(255, 85, 32, 47)
  ];

  int currentBgColor = 0;

  void changeColor() {
    setState(() {
      currentBgColor = (currentBgColor + 1) % colors.length;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[currentBgColor],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50),
            TextField(
              controller: myController,
            ),
            SizedBox(height: 50),
            Text(
              'You have entered:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$_inputtext',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 80),
            ElevatedButton(
              onPressed: _newtext,
              child: Text(
                'Show Text',
              ),
            ),
            SizedBox(height: 16), // Add gap of 16 pixels
            ElevatedButton(
              onPressed: changeColor,
              child: Text('Click to change bg color'),
            ),
          ],
        ),
      ),
    );
  }
}
