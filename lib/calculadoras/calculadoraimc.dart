import 'package:flutter/material.dart';
import 'package:projeto_quarta/homepage.dart';


class IMC extends StatelessWidget {
  const IMC({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculadoraIMC(),
      theme: ThemeData.dark()
    );
  }
}



class CalculadoraIMC extends StatefulWidget {
  @override
  _CalculadoraIMCState createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  TextEditingController _pesoController = TextEditingController();
  TextEditingController _alturaController = TextEditingController();
  double _resultado = 0.0;
  String classe = '';

  void _calcularIMC() {
    double peso = double.tryParse(_pesoController.text) ?? 0.0;
    double altura = double.tryParse(_alturaController.text) ?? 0.0;
    
    if (peso > 0 && altura > 0) {
      double imc = peso / (altura * altura);
      setState(() {
        _resultado = imc;
      });
      if(_resultado < 16){
 classe = 'Baixo peso, muito grave!!';
}
else if(_resultado >= 16 && _resultado <= 16.99){
 classe ='Baixo peso, grave!';
}
else if(_resultado >= 17 && _resultado <= 18.49) {
classe = 'Baixo peso!';
}
else if(_resultado > 18.50 && _resultado <= 24.99) {
classe = 'Peso normal!';
}
else if(_resultado > 25 && _resultado <= 29.99) {
  classe = 'Sobrepeso!';
}
else if(_resultado > 30 && _resultado <= 34.99) {
  classe = 'Obesidade grau I!';
}
else if(_resultado > 35 && _resultado <= 39.99) { 
classe = 'Obesidade grau II!!';
}

else {
classe = 'Obesidade grau III!!';
}
    } else {
      setState(() {
        _resultado = 0.0;
      });
    }



  }

  Widget _title() {
    return const Text('CalcMaster');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          },
        ),
        backgroundColor: Color.fromARGB(255, 94, 8, 0),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/background.jpg'),
          fit: BoxFit.fill)
        ),
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
       child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
              ),
            ),
            TextField(
              controller: _alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura (m)',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(200,50)),
              backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 95, 16, 16))
              ),
              onPressed: _calcularIMC,
              child: Text('Calcular IMC', style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 16.0),
            Text(
              'IMC: ${_resultado.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold
              ),
            ),
            if (_resultado > 0) Text(classe),
          ],
        ),
      ),
    )
      )
    );
  }
}