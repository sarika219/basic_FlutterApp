import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
    //throw UnimplementedError();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Whats\'s your favourite colour?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 9},
        {'text': 'Blue', 'score': 8},
        {'text': 'Pink', 'score': 7},
      ],
    },
    {
      'questionText': 'What\'s your favourite activity?',
      'answers': [
        {'text': 'Trekking', 'score': 10},
        {'text': 'Exploring', 'score': 9},
        {'text': 'Shopping', 'score': 8},
        {'text': 'Swimming', 'score': 7},
      ],
    },
    {
      'questionText': 'What\'s your favourite dream vacation?',
      'answers': [
        {'text': 'Africa', 'score': 10},
        {'text': 'South Korea', 'score': 9},
        {'text': 'Singapore', 'score': 8},
        {'text': 'Maldives', 'score': 7},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
