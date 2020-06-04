import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/result.dart';

main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _questionSelected = 0;
  int _totalGrade = 0;

  final List<Map<String, Object>> _questions = [
    {
      'question': 'Qual seu animal favorito ?',
      'responses': [
        {'text': 'Cachorro', 'grade': 8},
        {'text': 'Gato', 'grade': 10},
        {'text': 'Leão', 'grade': 6},
        {'text': 'Rato', 'grade': 2}
      ]
    },
    {
      'question': 'Qual seu programa de TV favorito ?',
      'responses': [
        {'text': 'X-MEN', 'grade': 10},
        {'text': 'Ben10', 'grade': 8},
        {'text': 'Super Shock', 'grade': 9},
        {'text': 'Homem Aranha', 'grade': 3}
      ]
    },
    {
      'question': 'Qual sua matéria favorita ?',
      'responses': [
        {'text': 'Português', 'grade': 2},
        {'text': 'Matemática', 'grade': 10},
        {'text': 'História', 'grade': 7},
        {'text': 'Geografia', 'grade': 7}
      ]
    }
  ];

  bool get hasMoreQuestions {
    return _questionSelected < _questions.length;
  }

  void _response(int grade) {
    if (hasMoreQuestions) {
      setState(() {
        _questionSelected++;
        _totalGrade += grade;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _questionSelected = 0;
      _totalGrade = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Quiz')),
          body: hasMoreQuestions
              ? Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Quiz(
                    questions: _questions,
                    questionSelected: _questionSelected,
                    response: _response),
              )
              : Result(_totalGrade, restartQuiz)),
    );
  }
}
