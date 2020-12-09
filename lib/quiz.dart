import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        // Spread Operator to expand out the list of Answer Widgets within the Column
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          // onPressed must return void, so we call the function within an anonymous one.
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        })
      ],
    );
  }
}
