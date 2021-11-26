import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String questao;

  const Questao({Key? key, required this.questao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Text(
        questao,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 28),
      ),
    );
  }
}
