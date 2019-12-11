import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'model/Usuario.dart';


class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  TextEditingController _controlerNome = new TextEditingController();
  TextEditingController _controlerEmail = new TextEditingController();
  TextEditingController _controlerSenha = new TextEditingController();
  String _mensagem = "";
  _cadastrarUsuario(){

    Usuario usuario = new Usuario();
    usuario.nome = _controlerNome.text;
    usuario.email = _controlerEmail.text;
    usuario.senha = _controlerSenha.text;
    
    FirebaseAuth.instance
                .createUserWithEmailAndPassword(email: usuario.email, password: usuario.senha)
                .then((FirebaseUser){
                  setState(() {
                    _mensagem = "Sucesso ao cadastrar !!!";
                  });
    }).catchError((error){
      setState(() {
        _mensagem = "Falha ao cadastrar "+error;
      });
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(color: Color(0xff075E54)),
        child: Padding(padding: EdgeInsets.all(16),

          child: Center(
            child:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(bottom: 32),
                      child: Image.asset("imagens/usuario.png",width: 80,height: 80,)),
                  Padding(padding: EdgeInsets.only(bottom: 8),
                    child: TextField(
                      controller: _controlerNome,
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          hintText: "Nome",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32)
                          )
                      ),
                    ),
                  ),

                  Padding(padding: EdgeInsets.only(bottom: 10),child:
                   TextField(
                     controller:  _controlerEmail,
                    autofocus: true,
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
                    controller: _controlerSenha,
                    obscureText: true,
                    keyboardType: TextInputType.text,
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
                      _cadastrarUsuario();
                    },child: Text("Entrar"),
                      color: Colors.green,
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
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
