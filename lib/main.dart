//porta de entrada do app main

import 'package:flutter/material.dart';
import 'package:my/perguntas.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntasSelecionadas = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, dynamic>> _perguntas = const [
    {
      'text': 'Qual é a sua cor favorita?',
      'resposta': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 2},
        {'texto': 'Verde', 'pontuacao': 5},
        {'texto': 'Azul', 'pontuacao': 12},
      ],
    },
    {
      'text': 'Qual é o seu animal favorito?',
      'resposta': [
        {'texto': 'Cachorro', 'pontuacao': 14},
        {'texto': 'Gato', 'pontuacao': 9},
        {'texto': 'Elefante', 'pontuacao': 7},
        {'texto': 'Leão', 'pontuacao': 16},
      ],
    },
    {
      'text': 'Qual é o seu estrutor favorito?',
      'resposta': [
        {'texto': 'Anderson', 'pontuacao': 5},
        {'texto': 'Leo', 'pontuacao': 6},
        {'texto': 'Leticia', 'pontuacao': 9},
        {'texto': 'Matheus', 'pontuacao': 10},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntasSelecionadas++;
        _pontuacaoTotal += pontuacao;
      });
    }
    // print(_perguntasSelecionadas);
  } //função que muda o estado do app

  void _reiniciarQuestionario() {
    setState(() {
      _perguntasSelecionadas = 0;
      _pontuacaoTotal = 0;
    });
  }

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
                  quandoResponder: _responder,
                )
                :
                //  para não exbir nada , ou colocar as resposta
                Resultado(
                  _pontuacaoTotal,
                  _reiniciarQuestionario,
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
