import 'package:flutter/material.dart';
import 'Pages/Flashcard.dart';
import 'Pages/Homepage.dart';
import 'Pages/Quiz.dart';
import 'Pages/Score.dart';
import 'Pages/model.dart';

List<QuizData> flashcardList = []; // Global list to store flashcards

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashcard Quiz App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/add_flashcard': (context) => AddFlashcard(),
        '/quiz': (context) => QuizScreen(quizData: flashcardList),
        '/scores': (context) {
          final score = ModalRoute.of(context)!.settings.arguments as int;
          return ScoreScreen(score: score);
        },
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
