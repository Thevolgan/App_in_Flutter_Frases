// ignore_for_file: deprecated_member_use


import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; //importar para animações

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(), //instancia o Home como Home()
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _frases = [
    "É tudo uma ladeira abaixo a partir daqui.",
    "Nunca é tarde para falhar",
    "A estrada para o sucesso está sempre em construção.",
    "Quando as coisas ficam difíceis, as difíceis ficam ainda mais difíceis."
  ];

  var _fraseGerada = "Use o botão para gerar!";

  void _gerarFrase(){
    var numeroSorteado = Random().nextInt(_frases.length);

    setState(() {
      _fraseGerada = _frases[ numeroSorteado ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 7, 165),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.battery_unknown_sharp),
            SizedBox(
              width: 10,
            ),
            Text("Aquela Frase"),
          ],
        ),
      ),



      body: Center(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //ANIMAÇÃO
              Lottie.network(
                  'https://assets8.lottiefiles.com/packages/lf20_itqodaed.json'),

              Text(
                _fraseGerada,
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 3,
                  //fontFamily: "Kanit",
                ),
              ),

              RaisedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Gerar Frase",
                      style: TextStyle(
                        //fontFamily: "Kanit",
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 3,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.cached_rounded),
                  ],
                ),
                color: Color.fromARGB(255, 30, 7, 165),
                onPressed: _gerarFrase,
              ),

              /*ElevatedButton( 
                               
                style: ElevatedButton.styleFrom(
              // Foreground color
                  onPrimary: Theme.of(context).colorScheme.onPrimary,
              // Background color
                  primary: Theme.of(context).colorScheme.primary,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(1.0)),
              onPressed: (){},
              child: const Text('Filled')
              ),*/
            ]),
      )),
    );
  }
}
