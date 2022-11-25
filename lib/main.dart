import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('じゃんけん'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                print('✊');
              },
              child: const Text('✊'),
            ),
            ElevatedButton(
              onPressed: () {
                print('✌️');
              },
              child: const Text('✌️'),
            ),
            ElevatedButton(
              onPressed: () {
                print('✋');
              },
              child: const Text('✋'),
            ),
          ],
        ),
      ),
    );
  }
}
