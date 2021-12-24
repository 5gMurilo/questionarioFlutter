import 'package:flutter/material.dart';

class FinishScreen extends StatelessWidget {
  final int pontuacao;
  final void Function() restart;

  FinishScreen(this.pontuacao, this.restart);

  @override
  Widget build(BuildContext context) {
    String finishText = 'Parabéns\nVocê fez $pontuacao pontos!';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            finishText,
            style: const TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
        ),
        Image.network(
          'https://pm1.narvii.com/6675/4da277ecb9f18e538bff8f77a230711b73a1b52c_hq.jpg',
          width: 300,
          height: 200,
        ),
        TextButton(
          onPressed: restart,
          child: const Text(
            'Deseja reiniciar?',
            style: TextStyle(fontSize: 18),
          ),
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 251, 245, 243),
            onPrimary: Color.fromARGB(255, 222, 60, 75),
          ),
        )
      ],
    );
  }
}
