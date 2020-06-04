import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  final String text;
  final void Function() onSelected;

  Response(this.text, this.onSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(this.text),
        onPressed: this.onSelected,
      ),
    );
  }
}
