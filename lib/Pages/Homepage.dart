import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white60,
      appBar: AppBar(
        title: Text(
          'Flashcard Quiz App',
         
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(22)),
            Text( 
              'Welcome to Flashcard Quiz',
              style: TextStyle(fontSize:24, fontWeight: FontWeight.bold,),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_flashcard');
              },
              child: Text('Add Flashcard'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple,
                maximumSize: Size(200, 60),
                fixedSize: Size(200, 60), 
                padding: EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), 
                ),
                textStyle: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/quiz');
              },
              child: Text('Start Quiz'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple, 
                maximumSize: Size(200, 60),
                fixedSize: Size(200, 60), 
                padding: EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), 
                ),
                textStyle: TextStyle(
                  fontSize: 18, // Increase text size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/scores');
              },
              child: Text('View Scores'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple, 
                maximumSize: Size(200, 60),
                fixedSize: Size(200, 60), 
                padding: EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), 
                ),
                textStyle: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height:80),

            Image.asset('images/quiz.JPG')
          ],
        ),
      ),
    );
  }
}