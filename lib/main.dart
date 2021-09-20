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
  final _questions = const [
    {
      'questionText': 'What\'s your favorite subject of study?',
      'answer': [
        {'text': 'Software Engineering', 'score': 10},
        {'text': 'Artificial Intelligence', 'score': 7},
        {'text': 'Machine Learning', 'score': 5},
        {'text': 'Databases', 'score': 3},
      ],
    },
    {
      'questionText': 'What\'s your favorite programming language?',
      'answer': [
        {'text': 'Java', 'score': 10},
        {'text': 'Python', 'score': 12},
        {'text': 'Dart', 'score': 7},
        {'text': 'JavaScript', 'score': 5},
      ],
    },
    {
      'questionText': 'What\'s your favorite Framework?',
      'answer': [
        {'text': 'Spring', 'score': 10},
        {'text': 'Angular', 'score': 9},
        {'text': 'Flutter', 'score': 7},
        {'text': 'Vue', 'score': 3},
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
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
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
