import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'じゃんけん'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String myJankenText = '👊';
  String computerjankenText = '?';

  List<String> jankenList = [
    '👊',
    '✌️',
    '✋',
  ];

  void randomComputerJankenText() {
    final random = Random();
    int randomNumber = random.nextInt(3);
    setState(() {
      computerjankenText = jankenList[randomNumber];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '相手',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              computerjankenText,
              style: TextStyle(fontSize: 100),
            ),
            const SizedBox(height: 80),
            const Text(
              '自分',
              style: TextStyle(fontSize: 50),
            ),
            Text(
              myJankenText,
              style: TextStyle(fontSize: 200),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                myJankenText = '👊';
              });
              randomComputerJankenText();
            },
            child: const Text(
              '👊',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                myJankenText = '✌️';
              });
              randomComputerJankenText();
            },
            child: const Text(
              '✌️',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                myJankenText = '✋️';
              });
              randomComputerJankenText();
            },
            child: const Text(
              '✋',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
