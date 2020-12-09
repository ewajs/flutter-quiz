import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print('Answer chosen');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'Favorite Color?',
        'answers': [
          'Black',
          'Red',
          'Green',
          'White',
        ]
      },
      {
        'questionText': 'Favorite Scientist?',
        'answers': [
          'Newton',
          'Darwin',
          'Einstein',
          'Feinmann',
        ]
      },
      {
        'questionText': 'Favorite Astronaut?',
        'answers': [
          'Armstrong',
          'Aldrin',
          'Collins',
          'Gagarin',
        ]
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            // Spread Operator to expand out the list of Answer Widgets within the Column
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            })
          ],
        ),
      ),
    );
  }
}
