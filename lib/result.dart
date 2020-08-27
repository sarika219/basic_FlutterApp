import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!!';
    if (resultScore <= 28) {
      resultText = 'You are adventurous';
    } else if (resultScore > 28 && resultScore <= 35) {
      resultText = 'Pretty Likeable!!';
    } else if (resultScore > 35 && resultScore <= 38) {
      resultText = 'You are strange!!';
    } else {
      resultText = 'You are so bad!!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
              onPressed: resetHandler,
              child: Text('Restart Quiz'),
              textColor: Colors.blue),
        ],
      ),
    );
  }
}
