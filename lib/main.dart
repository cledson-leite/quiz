import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';

import 'resultado.dart';

main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionado = 0;
  int _pontuacao = 0;

  final List<Map<String, dynamic>> _perguntas = [
    {
      'pergunta': 'Qual é sua cor favorita?',
      "resposta": [
        {'texto': 'Preto', 'pontos': 10},
        {'texto': 'Vermelho', 'pontos': 5},
        {'texto': 'Verde', 'pontos': 3},
        {'texto': 'Branco', 'pontos': 1},
      ],
    },
    {
      'pergunta': 'Qual é seu animal favorito?',
      "resposta": [
        {'texto': 'Coelho', 'pontos': 10},
        {'texto': 'Cobra', 'pontos': 5},
        {'texto': 'Elefante', 'pontos': 3},
        {'texto': 'Leão', 'pontos': 1},
      ],
    },
    {
      'pergunta': 'Qual é seu Instrutor favorito?',
      "resposta": [
        {'texto': 'Leo', 'pontos': 10},
        {'texto': 'Maria', 'pontos': 5},
        {'texto': 'João', 'pontos': 3},
        {'texto': 'Pedro', 'pontos': 1},
      ],
    },
  ];

  bool get temPerguntaSelecionada => _perguntaSelecionado < _perguntas.length;

  void _responder(int pontos) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionado++;
        _pontuacao += pontos;
      });
    }
  }

  void _reiniciar() {
    setState(() {
      _perguntaSelecionado = 0;
      _pontuacao = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionado: _perguntaSelecionado,
                responder: _responder,
                temPerguntaSelecionada: temPerguntaSelecionada,
              )
            : Resultado(
                pontuacao: _pontuacao,
                reiniciar: _reiniciar,
              ),
      ),
    );
  }
}
