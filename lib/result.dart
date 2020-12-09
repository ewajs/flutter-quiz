import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final Function resetQuiz;

  Result(this.finalScore, this.resetQuiz);

  // Getter for result phrase
  String get resultPhrase {
    String resultText;
    if (finalScore <= 3) {
      resultText = 'Werid...';
    } else if (finalScore <= 6) {
      resultText = 'Meh...';
    } else if (finalScore <= 9) {
      resultText = 'Great!';
    } else {
      resultText = 'Fantastic!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          FlatButton(
            child: Text(
              'Restart Quiz!',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            onPressed: resetQuiz,
          )
        ],
      ),
    );
  }
}
