import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
 
 class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
 
   
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

   String? errorMessage = '';
   bool isLogin = true;

   final TextEditingController _controllerEmail = TextEditingController();
   final TextEditingController _controllerPassword = TextEditingController();

   Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
       email: _controllerEmail.text,
       password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
      errorMessage = e.message;
      });
    }
   }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text
        );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }


Widget _title() {
  return const Text('CalcMaster');
  }

Widget _entryField(
  String title,
  TextEditingController controller,
){
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: title,
      ),
      
      
    
    style: TextStyle(),
  );
}

Widget _errorMessage() {
  return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
}

Widget _submitButton() {
  return ElevatedButton(
    style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(200,50)),
    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 95, 16, 16))
    ),
   onPressed:
   isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
   child: Text(isLogin ? 'Entrar' : 'Registrar'),
   );
}

Widget _loginOrRegisterButton() {
  return TextButton(
    onPressed: () {
     setState(() {
       isLogin = !isLogin;
     });
    },
    child: Text(isLogin ? 'Registrar' : 'Entrar', style: TextStyle(color: const Color.fromARGB(255, 150, 13, 3)),),
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
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[  

            Text("Insira suas informações!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            _entryField('Email', _controllerEmail),
            _entryField('Senha', _controllerPassword),
            _errorMessage(),
            _submitButton(),
            _loginOrRegisterButton(),
            SizedBox(height: 100,),

          ],
        )
      )
      )
    );
  }

}