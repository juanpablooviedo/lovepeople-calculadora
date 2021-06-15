import 'package:flutter/material.dart';

//! lovepeople_calculadora_(app_1)
//! 28.05.21

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String display = '';
  String operador = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcuradora'),
      ),
      body: Column(
        children: [
          _buildDisplay(),
          _buildButtons(),
        ],
      ),
    );
  }

// Layout de Display

  Widget _buildDisplay() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.all(14),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.fromBorderSide(
          BorderSide(color: Colors.black, width: 3),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        display,
        textAlign: TextAlign.end,
        style: TextStyle(color: Colors.white, fontSize: 40),
      ),
    );
  }

// Layout de Botoes

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            _buildButton('7'),
            _buildButton('4'),
            _buildButton('1'),
            _buildButton('C'),
          ],
        ),
        Column(
          children: [
            _buildButton('8'),
            _buildButton('5'),
            _buildButton('2'),
            _buildButton('0'),
          ],
        ),
        Column(
          children: [
            _buildButton('9'),
            _buildButton('6'),
            _buildButton('3'),
            _buildButton('='),
          ],
        ),
        Column(
          children: [
            _buildButton('/'),
            _buildButton('*'),
            _buildButton('-'),
            _buildButton('+'),
          ],
        ),
      ],
    );
  }

// Logica de Display

// Mostra

  void addInDisplay(String text) {
    setState(() {
      display += text;
    });
  }

// Apaga

  void apagar() {
    setState(() {
      display = '';
    });
  }

// Layout e Logica de botoes 
// Logica de Simbolos aritmeticos

  Widget _buildButton(String simbolo) {
    return Container(
      margin: EdgeInsets.all(1),
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {
          if (simbolo == '=') {
            calcular();
          } else if (simbolo == 'C') {
            apagar();
          } else {
            addInDisplay(simbolo);
          }
          if (simbolo == '-' ||
              simbolo == '+' ||
              simbolo == '/' ||
              simbolo == '*') {
            operador = simbolo;
          }
        },
        child: Text(
          simbolo,
          style: TextStyle(
            fontSize: 20,            
          ),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(18)),
        ),
      ),
    );
  }

// Logica de calculo aritmetico

  void calcular() {
    List<String> valores = display.split(operador);
    int valor1 = int.parse(valores[0]);
    int valor2 = int.parse(valores[1]);
    num resultado = 0;

    if (operador == '+') {
      resultado = valor1 + valor2;
    }
    if (operador == '-') {
      resultado = valor1 - valor2;
    }

    if (operador == '*') {
      resultado = valor1 * valor2;
    }
    if (operador == '/') {
      resultado = valor1 / valor2;
    }

// Resultado de calculo aritmetico

    setState(() {
      display = resultado.toString();
    });
  }
}
