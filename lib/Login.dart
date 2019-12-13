import 'package:flutter/material.dart';
import 'package:whatsapp_app/Cadastro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_app/Principal.dart';
import 'package:whatsapp_app/RouteGenerator.dart';
import 'package:whatsapp_app/model/Usuario.dart';
import 'package:whatsapp_app/Principal.dart';
class Login extends StatefulWidget {



  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _controllerEmail = new TextEditingController();
  TextEditingController _controllerSenha = new TextEditingController();
  var _mensagem = "debug";


  Future _login() async{

    FirebaseAuth autenticacao = FirebaseAuth.instance;
    FirebaseUser user = await  autenticacao.signInWithEmailAndPassword(email: _controllerEmail.text, password: _controllerSenha.text);
    //chama a proxima tela
    if( user.uid != null){

        Navigator.pushNamed(context, RouteGenerator.ROUTE_PRINCIPAL);


    }else{
      setState(() {
        _mensagem ="problema ao efetuar login";
      });
    }

  }

  Future _verificaUsuarioLogado() async{

    FirebaseAuth auth = FirebaseAuth.instance;

    FirebaseUser user = await auth.currentUser();

    if(user != null){

      Navigator.pushNamed(context, RouteGenerator.ROUTE_PRINCIPAL);


    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   _verificaUsuarioLogado();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(color: Color(0xff075E54)),
        child: Padding(padding: EdgeInsets.all(16),

          child: Center(
            child:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(bottom: 32),
                    child: Image.asset("imagens/logo.png",width: 200,height: 150,)),
                  Padding(padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    autofocus: false,
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "E-mail",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)
                        )
                    ),
                  ),
                  ),

                  TextField(
                    controller: _controllerSenha,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Senha",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)
                        )
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 16,bottom: 10),
                  child: RaisedButton(onPressed: (){
                    _login();
                  },child: Text("Entrar"),
                          color: Colors.green,
                          padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                  ),
                  ),
                  Center(
                    child: GestureDetector(
                      child: Text("Nao tem conta? cadastre-se",
                      style: TextStyle(color: Colors.white)),
                      onTap: (){
                        //chamr a tela de cadastro

                        Navigator.pushNamed(context, RouteGenerator.ROUTE_CADASTRO);

                      },
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      child: Text(_mensagem,
                          style: TextStyle(color: Colors.white)),
                      onTap: (){
                        //chamr a tela de cadastro

                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (contex) => Cadastro()
                            )
                        );

                      },
                    ),
                  )
                ],
              ),
            ) ,
        ),
        ),

      ),
    );
  }
}
