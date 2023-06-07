import 'dart:math';
import 'package:flutter/material.dart';
import 'package:projeto_quarta/homepage.dart';

class Bhaskara extends StatelessWidget {
  const Bhaskara({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: calcularbhaskara(),
      theme: ThemeData.dark(),
    );
  }
}




class calcularbhaskara extends StatefulWidget {
  const calcularbhaskara({super.key});

  @override
  State<calcularbhaskara> createState() => _calcularbhaskara();
}

class _calcularbhaskara extends State<calcularbhaskara> {

  TextEditingController _aController = TextEditingController();
  TextEditingController _bController = TextEditingController();
  TextEditingController _cController = TextEditingController();
  String _result = '';

  void _calculaBhaskara() {
    double a = double.tryParse(_aController.text) ?? 0.0;
    double b = double.tryParse(_bController.text) ?? 0.0;
    double c = double.tryParse(_cController.text) ?? 0.0;


    double delta = pow(b, 2) - (4 * a * c);

    if (delta < 0) {
      _result = 'Não há raízes reais.';
    } else if (delta == 0) {
      double root = -b / (2 * a);
      _result = 'Raiz única: $root';
    } else {
      double root1 = (-b + sqrt(delta)) / (2 * a);
      double root2 = (-b - sqrt(delta)) / (2 * a);
      _result = 'Raiz 1: $root1\nRaiz 2: $root2';
    }

    setState(() {});
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            TextField(
              controller: _aController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Valor de A',
              ),
            ),
            TextField(
              controller: _bController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Valor de B',
              ),
            ),
            TextField(
              controller: _cController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Valor de C',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(200,50)),
              backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 95, 16, 16))
              ),
              onPressed: _calculaBhaskara,
              child: Text('Calcular'),
            ),
            SizedBox(height: 16),
            Text(
              _result,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    )
       )
    );
  }
}