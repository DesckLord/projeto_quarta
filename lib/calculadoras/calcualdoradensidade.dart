import 'package:flutter/material.dart';
import 'package:projeto_quarta/homepage.dart';

class Densidade extends StatelessWidget {
  const Densidade ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalcularDensidade(),
      theme: ThemeData.dark()
    );
  }
}


class CalcularDensidade extends StatefulWidget {
  const CalcularDensidade({super.key});

  @override
  State<CalcularDensidade> createState() => _CalcularDensidadeState();
}

class _CalcularDensidadeState extends State<CalcularDensidade> {

 TextEditingController _massController = TextEditingController();
  TextEditingController _volumeController = TextEditingController();
  double _density = 0.0;

  void _calculateDensity() {
    double mass = double.tryParse(_massController.text) ?? 0.0;
    double volume = double.tryParse(_volumeController.text) ?? 0.0;

    if (mass > 0 && volume > 0) {
      double density = mass / volume;
      setState(() {
        _density = density;
      });
    } else {
      setState(() {
        _density = 0.0;
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
              MaterialPageRoute(builder: (context) => Homepage()));
          }
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
              controller: _massController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Massa (g)',
              ),
            ),
            TextField(
              controller: _volumeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Volume (cm³)',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(200,50)),
              backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 95, 16, 16))
              ),
              onPressed: _calculateDensity,
              child: Text('Calcular'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Densidade: ${_density.toStringAsFixed(2)} g/cm³',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 100,),
          ],
        ),
      ),
       )
       )
       );

  }
}