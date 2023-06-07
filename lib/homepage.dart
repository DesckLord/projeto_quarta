import 'package:projeto_quarta/calculadoras/calculadorabhaskara.dart';
import 'package:projeto_quarta/calculadoras/calculadoraimc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_quarta/calculadoras/calcualdoradensidade.dart';
import 'auth.dart';

// Criando a classe homepage
class Homepage extends StatelessWidget {

   Homepage({super.key});
   
     @override
     Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home:_Homepage(),
       theme: ThemeData.dark()
    );
     }

}

//Extendendo a classe Homepage com _Homepage
class _Homepage extends StatefulWidget {
  const _Homepage({super.key});

  @override
  State<_Homepage> createState() => _HomeState();
}

class _HomeState extends State<_Homepage> {

final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

//título
  Widget _title() {
    return const Text('CalcMaster');
  }

//Botão de logout
  Widget _signOutButton() {
    return FloatingActionButton(
      onPressed: signOut,
      child: Icon(Icons.logout),
      backgroundColor: Color.fromARGB(255, 82, 14, 14),
    );
  }


//botão da calculadora IMC
Widget _calculadoraimc(BuildContext context) {
 return ElevatedButton(
  style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(200,50)),
  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 95, 16, 16))
  ),
  onPressed: () { 
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => IMC()));
   },
  child: Text("Calcular IMC!", style: TextStyle(fontSize: 20)),
  

    );
}

//botão da calculadora Bhaskara
Widget _calculadorabhaskara(BuildContext context) {
 return ElevatedButton(
  style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(200,50)),
  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 95, 16, 16))
  ),
  onPressed: () {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => calcularbhaskara()));
    },
  child: Text("Calcular Bhaskara!", style: TextStyle(fontSize: 20)),
    );
}

//botão da calculadora Densidade
Widget _calculadoradensidade(context) {
 return ElevatedButton(
  style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(200,50)),
  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 95, 16, 16))
  ),
  onPressed: () {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Densidade()));
    },
  child: Text("Calcular Densidade!", style: TextStyle(fontSize: 19)),
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        centerTitle: true, 
        backgroundColor: Color.fromARGB(255, 94, 8, 0),
      ),    
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover)
        ),
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Bem vindo, selecione o tipo de cálculo que você gostaria de fazer!", style: TextStyle(fontSize: 25)),
            SizedBox(height: 70,),
            _calculadoraimc(context),
            SizedBox(height: 12,),
           _calculadorabhaskara(context),
            SizedBox(height: 12,),
           _calculadoradensidade(context),
            Expanded(child: Container()),
          Align(
            alignment: Alignment.bottomRight,
            child: _signOutButton(),
          ),        
          ],
        )
      ),
      
    );
  }
  }