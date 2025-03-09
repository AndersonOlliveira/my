//porta de entrada do app main

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my/perguntas.dart';
import './index.dart';
import './perguntas.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntasSelecionadas = 0;

  final List<Map<String, dynamic>> _perguntas = const [
    {
      'text': 'Qual é a sua cor favorita?',
      'resposta': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Vermelho', 'nota': 2},
        {'texto': 'Verde', 'nota': 5},
        {'texto': 'Azul', 'nota': 12},
      ],
    },
    {
      'text': 'Qual é o seu animal favorito?',
      'resposta': [
        {'texto': 'Cachorro', 'nota': 14},
        {'texto': 'Gato', 'nota': 9},
        {'texto': 'Elefante', 'nota': 7},
        {'texto': 'Leão', 'nota': 16},
      ],
    },
    {
      'text': 'Qual é o seu estrutor favorito?',
      'resposta': [
        {'texto': 'Anderson', 'nota': 5},
        {'texto': 'Leo', 'nota': 6},
        {'texto': 'Leticia', 'nota': 9},
        {'texto': 'Matheus', 'nota': 10},
      ],
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntasSelecionadas++;
      });
    }
    // print(_perguntasSelecionadas);
  } //função que muda o estado do app

  bool get temPerguntaSelecionada {
    return _perguntasSelecionadas < _perguntas.length;
  }

  ///dasdasdasdasdas
  // void Function() funcaoQueRetornaUmaFuncao(){
  //     return () {
  //       print('Pergunta respondida #01');
  //     };
  //

  //  void Function() funcaoQueRetornaUmaFuncao(){
  //     return () {
  //       print('Pergunta respondida #02');
  //     };
  //   }
  //QUANDO ALGO COMECA COM _ É PRIVADO
  // para tornar o atributo do metodo acessevel fora da classe e preciso definir o atributo como  get e set para que possa acessar o atributo fora da classe e manipular o atributo

  @override //sobrescrevendo o metodo build
  Widget build(BuildContext context) {
    // void printRespostas() {
    // for (String textRespo in respostas) {
    //   widgets.addAll(<Widget>[Resposta(textRespo, _responder)]);
    // }
    // }

    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Perguntas',
          ), //precisa passar o widget para saber que é um texto
        ),
        body:
            temPerguntaSelecionada
                ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntasSelecionadas,
                  QuandoResponder: _responder,
                )
                :
                //  para não exbir nada , ou colocar as resposta
                Resultado(
                  // : null, //aqui funciono com o operador ternario null
                ),
      ),
    );
  }
} //classe State<PerguntaApp>
//componetes sem estados

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  //metodo para criar um  estado

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
