import 'package:flutter/material.dart';

import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionado;
  final bool temPerguntaSelecionada;
  final List<Map<String, dynamic>> perguntas;
  final void Function(int) responder;

  const Questionario({
    Key? key,
    required this.perguntaSelecionado,
    required this.responder,
    required this.perguntas,
    required this.temPerguntaSelecionada,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionado].cast()['resposta']
        : [];
    List<Widget> _widgets = _respostas
        .map((item) => Resposta(
              resposta: item['texto'],
              quandoSelecionado: () => responder(item['pontos']),
            ))
        .toList();
    // for (String resp in perguntas[_perguntaSelecionado].cast()['resposta']) {
    //   widgets.add(
    // Resposta(
    //   resposta: resp,
    //   quandoSelecionado: _responder,
    // ),
    //   );
    // }
    return Column(
      children: [
        Questao(
          questao: perguntas[perguntaSelecionado]['pergunta'].toString(),
        ),
        ..._widgets,
      ],
    );
  }
}
