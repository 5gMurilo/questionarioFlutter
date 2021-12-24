import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  String respostas = '';
  final void Function() onSelected;

  Resposta(this.respostas, this.onSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(30, 10, 30, 0),
      child: ElevatedButton(
          child: Text(respostas),
          onPressed: onSelected,
          style: ElevatedButton.styleFrom(
            alignment: Alignment.center,
            elevation: 5,
            primary: const Color.fromARGB(255, 248, 189, 127),
          )),
    );
  }
}
