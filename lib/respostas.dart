import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;

  //recebe um paramento

  final void Function() onSelecao;

  const Resposta(this.texto, this.onSelecao, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSelecao,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyan,
          textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        child: Text(texto),
      ),
    );
  }
}
