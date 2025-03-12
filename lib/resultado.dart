import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;

  //reinicia
  final void Function() quandoReiniciarQuestionario;

  const Resultado(
    this.pontuacao,
    this.quandoReiniciarQuestionario, {
    super.key,
  });

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante!';
    } else {
      return 'Nivel Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //precisa passar a get da frase
        Center(child: Text(fraseResultado, style: TextStyle(fontSize: 28))),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          style: TextButton.styleFrom(backgroundColor: Colors.blue),
          child: Text('Reiniciar?', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}
