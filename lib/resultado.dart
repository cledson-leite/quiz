import 'package:flutter/material.dart';

// 3 5 7 9 11 12 14 16 18 20 21 23 25 30

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciar;

  const Resultado({
    Key? key,
    required this.pontuacao,
    required this.reiniciar,
  }) : super(key: key);

  String get fraseResultado {
    if (pontuacao < 10) {
      return 'Parabéns !';
    } else if (pontuacao < 20) {
      return 'Você é bom !!';
    } else if (pontuacao < 25) {
      return 'Impressionante !!!';
    } else {
      return 'Nível Jedi !!!!!!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: reiniciar,
          child: const Text(
            'Reiniciar',
            style: TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }
}
