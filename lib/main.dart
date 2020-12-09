import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print('Answer chosen');
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'Favorite Color?',
        'answers': [
          {'text': 'Black', 'score': 1},
          {'text': 'Red', 'score': 2},
          {'text': 'Green', 'score': 3},
          {'text': 'White', 'score': 4},
        ]
      },
      {
        'questionText': 'Favorite Scientist?',
        'answers': [
          {'text': 'Newton', 'score': 1},
          {'text': 'Darwin', 'score': 2},
          {'text': 'Einstein', 'score': 3},
          {'text': 'Feinmann', 'score': 4},
        ]
      },
      {
        'questionText': 'Favorite Astronaut?',
        'answers': [
          {'text': 'Armstrong', 'score': 1},
          {'text': 'Aldrin', 'score': 2},
          {'text': 'Collins', 'score': 3},
          {'text': 'Gagarin', 'score': 4},
        ]
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                questions: questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
