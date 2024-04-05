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
  //String myJankenText = '👊';
  //String computerjankenText = '?';

  Hand? myHand;
  Hand? computerHand;
  Result? result;

  /*List<String> jankenList = [
    '👊',
    '✌️',
    '✋',
  ];*/

  /*List<Hand> jankenList = [
    Hand.rock,
    Hand.scissors,
    Hand.paper,
  ];*/

  void randomComputerJankenText() {
    final random = Random();
    final randomNumber = random.nextInt(3);
    // enumはリストをすでに持っているので以下のように書く必要はない
    // final hand = jankenList[randomNumber];
    // enumのリストを使って書くと以下のようになる
    final hand = Hand.values[randomNumber];
    setState(() {
      computerHand = hand;
    });
    decideResult();
  }

  void decideResult() {
    if (myHand == null || computerHand == null) {
      return;
    }

    // finalでは値の代入は１回しかできない
    final Result result;

    // あいこパターン
    if (myHand == computerHand) {
      result = Result.draw;
    }
    // 勝ちパターン
    else if (myHand == Hand.rock && computerHand == Hand.scissors ||
        myHand == Hand.scissors && computerHand == Hand.paper ||
        myHand == Hand.paper && computerHand == Hand.rock) {
      result = Result.win;
    } else {
      // それ以外は負け
      result = Result.lose;
    }
    setState(() {
      this.result = result;
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
              computerHand?.text ?? '?',
              style: TextStyle(fontSize: 100),
            ),
            const SizedBox(height: 80),
            Text(
              result?.text ?? '?',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              myHand?.text ?? '?',
              style: TextStyle(fontSize: 200),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                myHand = Hand.rock;
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
                myHand = Hand.scissors;
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
                myHand = Hand.paper;
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

// Enum
enum Hand {
  rock,
  scissors,
  paper;

  String get text {
    switch (this) {
      case Hand.rock:
        return '👊';
      case Hand.scissors:
        return '✌️';
      case Hand.paper:
        return '✋';
    }
  }
}

enum Result {
  win,
  lose,
  draw;

  String get text {
    switch (this) {
      case Result.win:
        return '勝ち';
      case Result.lose:
        return '負け';
      case Result.draw:
        return 'あいこ';
    }
  }

  String get englishText {
    switch (this) {
      case Result.win:
        return 'win';
      case Result.lose:
        return 'lose';
      case Result.draw:
        return 'draw';
    }
  }
}
