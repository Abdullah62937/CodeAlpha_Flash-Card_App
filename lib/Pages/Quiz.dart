import 'package:flutter/material.dart';
import 'model.dart';

class QuizScreen extends StatefulWidget {
  final List<QuizData> quizData;

  QuizScreen({required this.quizData});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  String? _selectedOption;
  int _score = 0;

  void _submitAnswer() {
    if (_selectedOption == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an option')),
      );
      return;
    }

    if (_selectedOption == widget.quizData[_currentQuestionIndex].correctOption) {
      setState(() {
        _score++;
      });
    }

    setState(() {
      _currentQuestionIndex++;
      _selectedOption = null;
    });

    if (_currentQuestionIndex >= widget.quizData.length) {
      Navigator.pushNamed(context, '/scores', arguments: _score);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.quizData.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Text('No quiz data available', style: TextStyle(fontSize: 18, color: Colors.black54)),
        ),
      );
    }

    final currentQuestion = widget.quizData[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.purple, width: 2),
              ),
              child: Text(
                'Question ${_currentQuestionIndex + 1}: ${currentQuestion.question}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
              ),
            ),
            SizedBox(height: 20),
            ...currentQuestion.options.map((option) {
              return ListTile(
                title: Text(option, style: TextStyle(fontSize: 18)),
                leading: Radio<String>(
                  value: option,
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value;
                    });
                  },
                ),
              );
            }).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitAnswer,
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
