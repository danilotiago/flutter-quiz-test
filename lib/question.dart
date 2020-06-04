import 'package:flutter/cupertino.dart';

class Question extends StatelessWidget {
  final String text;

  Question(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // define um container de largura máxima
      margin: EdgeInsets.all(10.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center, // centraliza o texto no container acima
      ),
    );
  }
}
