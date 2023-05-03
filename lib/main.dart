import 'package:flutter/material.dart';

void main() => runApp(IMCCalculator());

class IMCCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de IMC'),
        ),
        body: IMCCalculatorForm(),
      ),
    );
  }
}

class IMCCalculatorForm extends StatefulWidget {
  @override
  _IMCCalculatorFormState createState() => _IMCCalculatorFormState();
}

class _IMCCalculatorFormState extends State<IMCCalculatorForm> {
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  double _imc = 0;
  String _tipoIMC = '';

//  void _calcularIMC() {
//    double peso = double.tryParse(pesoController.text) ?? 0;
//  double altura = double.tryParse(alturaController.text) ?? 0;
//    if (peso == 0 || altura == 0) {
//      setState(() {
//        _imc = 0;
//      });
//      return;
//    }
//    double imc = peso / (altura * altura / 10000);
//    setState(() {
//      _imc = imc;
//    });
//  }
  void _calcularIMC() {
    double peso = double.tryParse(pesoController.text) ?? 0;
    double altura = double.tryParse(alturaController.text) ?? 0;

    if (peso == 0 || altura == 0) {
      setState(() {
        _imc = 0;
        _tipoIMC = '';
      });
      return;
    }

    double imc = peso / (altura * altura / 10000);

    setState(() {
      _imc = imc;
      if (imc < 18.5) {
        _tipoIMC = 'Abaixo do peso ideal';
      } else if (imc >= 18.5 && imc < 25) {
        _tipoIMC = 'Peso normal';
      } else if (imc >= 25 && imc < 30) {
        _tipoIMC = 'Sobrepeso';
      } else if (imc >= 30 && imc < 35) {
        _tipoIMC = 'Obesidade grau I';
      } else if (imc >= 35 && imc < 40) {
        _tipoIMC = 'Obesidade grau II';
      } else {
        _tipoIMC = 'Obesidade grau III (mórbida)';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            controller: pesoController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Peso (kg)',
            ),
          ),
          TextField(
            controller: alturaController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Altura (cm)',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: _calcularIMC,
              child: Text('Calcular'),
            ),
          ),
//          Text(
//            _imc == 0 ? 'Informe seus dados' : 'IMC: ${_imc.toStringAsFixed(2)}',
//            style: Theme.of(context).textTheme.headline6,
//            textAlign: TextAlign.center,
//          ),
          Text(
            _imc == 0
                ? 'Informe seus dados'
                : 'IMC: ${_imc.toStringAsFixed(2)} - $_tipoIMC',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
