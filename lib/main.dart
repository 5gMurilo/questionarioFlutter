import 'package:flutter/material.dart';
import 'package:projeto_perguntas/finishScreen.dart';
import 'package:projeto_perguntas/questionario.dart';

void main(List<String> args) {
  runApp(new QuestionsApp());
}

class QuestionsApp extends StatefulWidget {
  @override
  State<QuestionsApp> createState() => _QuestionsAppState();
}

class _QuestionsAppState extends State<QuestionsApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  void responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }

    print(_pontuacaoTotal);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  final List<Map<String, Object>> _perguntas = [
    {
      'pergunta': 'Qual a sua idade?',
      'respostas': [
        {'texto': '20', 'pontuacao': 10},
        {'texto': '19', 'pontuacao': 8},
        {'texto': '18', 'pontuacao': 5},
        {'texto': '17', 'pontuacao': 3},
      ]
    },
    {
      'pergunta': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Verde', 'pontuacao': 8},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'azul', 'pontuacao': 3},
      ]
    },
    {
      'pergunta': 'Qual seu filme favorito?',
      'respostas': [
        {'texto': 'Harry Potter', 'pontuacao': 10},
        {'texto': 'Homem Aranha', 'pontuacao': 8},
        {'texto': 'Vingadores', 'pontuacao': 5},
        {'texto': 'Velozes e furiosos', 'pontuacao': 3},
      ]
    }
  ];

  void restart() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Perguntas'),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 245, 172, 114),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: responder)
              : FinishScreen(_pontuacaoTotal, restart)),
    );
  }
}
