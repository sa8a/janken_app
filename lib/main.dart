import 'package:flutter/material.dart';
// Transform.rotateでpiを使うため
import 'dart:math';

// math.Random()使うため
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand = '';
  String yourHand = '';
  String result = '';

  void _getMyHand(String getHand) {
    setState(() {
      myHand = getHand;
      _generateYourHand();
      _result();
    });
  }

  void _generateYourHand() {
    final randomNum = math.Random().nextInt(3);
    yourHand = _randomNumToHand(randomNum);
  }

  String _randomNumToHand(int randomNum) {
    if (randomNum == 0) {
      return '✊';
    } else if (randomNum == 1) {
      return '✌️';
    } else if (randomNum == 2) {
      return '✋';
    } else {
      return '失敗...もう一度試してください。';
    }
  }

  void _result() {
    if (myHand == yourHand) {
      result = '引き分け';
    } else if (myHand == '✊' && yourHand == '✌️' ||
        myHand == '✌️' && yourHand == '✋' ||
        myHand == '✋' && yourHand == '✊') {
      result = 'あなたの勝ち';
    } else {
      result = 'あなたの負け';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('じゃんけん'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            const Text(
              '相手',
              style: TextStyle(fontSize: 20),
            ),
            Transform.rotate(
              angle: 180 * pi / 180,
              child: Text(
                yourHand,
                style: const TextStyle(fontSize: 40),
              ),
            ),
            const SizedBox(height: 50),
            Text(
              myHand,
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _getMyHand('✊');
                  },
                  child: const Text('✊'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _getMyHand('✌️');
                  },
                  child: const Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _getMyHand('✋');
                  },
                  child: const Text('✋'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
