import 'package:flutter/material.dart';
import 'package:my/perguntas.dart';
import './index.dart';
import './respostas.dart';
import './resultado.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, dynamic>> perguntas;
  final void Function(int) quandoResponder;

  //metodo construtor
  const Questionario({super.key, 
    required this.perguntaSelecionada,
    required this.perguntas,
    required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas =
        temPerguntaSelecionada
            ? perguntas[perguntaSelecionada]['resposta']
                as List<Map<String, Object>>
            : [];
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['text'].toString()),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'].toString(),
            () => quandoResponder(int.parse(resp['pontuacao'].toString())),
          );
        }),
      ],
    );
  }
}
