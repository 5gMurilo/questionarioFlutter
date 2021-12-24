import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resposta.dart';
import 'questoes.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) responder;

  Questionario(
      {required this.perguntas,
      required this.perguntaSelecionada,
      required this.responder});

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    List<Widget> widgets = respostas
        .map((resp) => Resposta(resp['texto'].toString(),
            () => responder(int.parse(resp['pontuacao'].toString()))))
        .toList();

    return Column(children: <Widget>[
      Questao(perguntas[perguntaSelecionada]['pergunta'].toString()),
      ...widgets
    ]);
  }
}
