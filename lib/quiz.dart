import 'package:flutter/material.dart';
import 'package:quiz/question.dart';
import 'package:quiz/response.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionSelected;
  final Function(int) response;

  Quiz({
    @required this.questions,
    @required this.questionSelected,
    @required this.response,
  });

  bool get hasMoreQuestions {
    return questionSelected < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> responses =
        hasMoreQuestions ? questions[questionSelected]['responses'] : null;

    return Column(
      children: <Widget>[
        Question(questions[questionSelected]['question']),
        ...responses.map((resp) {
          return Response(
            resp['text'],
            () => response(resp['grade']),
          );
        }).toList()
      ],
    );
  }
}
