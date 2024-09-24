import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  final int score;

  ScoreScreen({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scores')),
      body: Center(
        child: Text(
          'Your Score: $score',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
