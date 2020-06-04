import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _totalGrade;
  final Function() onRestartQuiz;

  Result(this._totalGrade, this.onRestartQuiz);

  String get resultPhrase {
    if (_totalGrade < 8)
      return 'Parabéns!';
    else if (_totalGrade < 12)
      return 'Você é bom!';
    else if (_totalGrade < 16)
      return 'Impressionante!';
    else
      return 'Espetacular!';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
          onPressed: onRestartQuiz,
        )
      ],
    );
  }
}
