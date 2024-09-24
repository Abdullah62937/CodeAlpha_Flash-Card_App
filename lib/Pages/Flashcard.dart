import 'package:flashcard_quiz_app/main.dart';
import 'package:flutter/material.dart';
import 'model.dart'; // Import the QuizData model

class AddFlashcard extends StatefulWidget {
  @override
  _AddFlashcardScreenState createState() => _AddFlashcardScreenState();
}

class _AddFlashcardScreenState extends State<AddFlashcard> {
  final _questionController = TextEditingController();
  final _option1Controller = TextEditingController();
  final _option2Controller = TextEditingController();
  final _option3Controller = TextEditingController();
  final _option4Controller = TextEditingController();
  
  String _correctOption = ''; // Store the selected correct option
  List<String> _options = []; // List to store the options

  void _updateOptions() {
    setState(() {
      _options = [
        _option1Controller.text,
        _option2Controller.text,
        _option3Controller.text,
        _option4Controller.text,
      ].where((option) => option.isNotEmpty).toList();
    });
  }

  void _saveFlashcard() {
    if (_correctOption.isEmpty || _questionController.text.isEmpty || _options.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields and select the correct option')),
      );
      return;
    }

    QuizData newFlashcard = QuizData(
      question: _questionController.text,
      options: _options,
      correctOption: _correctOption,
    );

    // Add the flashcard to the global list
    flashcardList.add(newFlashcard);

    // Navigate back to the home page or show success message
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Flashcard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _questionController,
                decoration: InputDecoration(labelText: 'Question'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _option1Controller,
                decoration: InputDecoration(labelText: 'Option 1'),
                onChanged: (_) => _updateOptions(),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _option2Controller,
                decoration: InputDecoration(labelText: 'Option 2'),
                onChanged: (_) => _updateOptions(),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _option3Controller,
                decoration: InputDecoration(labelText: 'Option 3'),
                onChanged: (_) => _updateOptions(),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _option4Controller,
                decoration: InputDecoration(labelText: 'Option 4'),
                onChanged: (_) => _updateOptions(),
              ),
              SizedBox(height: 20),

              // Dropdown for selecting the correct option
              DropdownButtonFormField<String>(
                value: _correctOption.isEmpty ? null : _correctOption,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  filled: true,
                  fillColor: Colors.purple.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                hint: Text('Select Correct Option'),
                onChanged: (String? newValue) {
                  setState(() {
                    _correctOption = newValue!;
                  });
                },
                items: _options.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 40),

              ElevatedButton(
                onPressed: _saveFlashcard,
                child: Text('Save Flashcard'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple,
                  maximumSize: Size(200, 60),
                  fixedSize: Size(200, 60), 
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
      ),
    );
  }
}
