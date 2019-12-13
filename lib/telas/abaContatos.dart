import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_app/model/Conversas.dart';
import 'package:whatsapp_app/model/Usuario.dart';

class abaContatos extends StatefulWidget {
  @override
  _abaContatosState createState() => _abaContatosState();
}

class _abaContatosState extends State<abaContatos> {


  Future<List<Usuario>> _recuperarContatos() async{

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser user = await auth.currentUser();


    Firestore db = Firestore.instance;
    QuerySnapshot querySnapshot = await db.collection("usuarios").getDocuments();
    List<Usuario> listUsuario = new List();

    for( DocumentSnapshot item in querySnapshot.documents ){

      var dados = item.data;

      if(dados["email"] != user.email) {
        Usuario usuario = new Usuario();

        usuario.email = dados["email"];
        usuario.nome = dados["nome"];
        usuario.urlImagem = dados["urlImagem"];
        usuario.idUsuario = item.documentID;

        listUsuario.add(usuario);
      }
    }

    return listUsuario;
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Usuario>>(
      future: _recuperarContatos(),
      builder: (context,snapshot){

        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
                return Center(
                  child: Column(
                    children: <Widget>[
                      Text("Carregando Conversas"),
                      CircularProgressIndicator()

                    ],
                  ),

                );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, indice){

                  List<Usuario> listaItem = snapshot.data;
                  Usuario usuario = listaItem[indice];

                  return ListTile(
                    onTap: (){

                        Navigator.pushNamed(context, "/mensagem",
                                              arguments: usuario);

                    },
                    contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    leading: CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Colors.grey,
                      backgroundImage:
                      usuario.urlImagem != null
                          ? NetworkImage(usuario.urlImagem)
                          : null,
                    ),
                    title: Text(
                      usuario.nome,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),

                  );

                }
            );
            break;


        }

      },

    );
  }
}
