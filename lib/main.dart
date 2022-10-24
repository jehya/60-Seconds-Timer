import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int countdownfrom = 60;

  void _startCountDown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdownfrom > 0) {
        setState(() {
          countdownfrom--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _resetbutton() {
    setState(() {
      countdownfrom = 60;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('60 Seconds Timer'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              countdownfrom.toString(),
              style: TextStyle(fontSize: 100),
            ),
            MaterialButton(
              onPressed: _startCountDown,
              child: Text('START', style: TextStyle(color: Colors.white)),
              color: Colors.blueGrey[600],
            ),
            MaterialButton(
              onPressed: _resetbutton,
              child: Text('RESET', style: TextStyle(color: Colors.white)),
              color: Colors.blueGrey[700],
            ),
          ],
        ),
      ),
    );
  }
}
