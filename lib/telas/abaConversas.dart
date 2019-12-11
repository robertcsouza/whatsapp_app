import 'package:flutter/material.dart';
import 'package:whatsapp_app/model/Conversas.dart';
class abaConversas extends StatefulWidget {
  @override
  _abaConversasState createState() => _abaConversasState();
}

class _abaConversasState extends State<abaConversas> {

  List<Conversas> listaConversas = [
    Conversas(
        "Ana Clara",
        "Olá tudo bem?",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-36cd8.appspot.com/o/perfil%2Fperfil1.jpg?alt=media&token=97a6dbed-2ede-4d14-909f-9fe95df60e30"
    ),
    Conversas(
        "Pedro Silva",
        "Me manda o nome daquela série que falamos!",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-36cd8.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=659622c6-4a5d-451a-89b9-05712c64b526"
    ),
    Conversas(
        "Marcela Almeida",
        "Vamos sair hoje?",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-36cd8.appspot.com/o/perfil%2Fperfil3.jpg?alt=media&token=99ad2441-7b1a-4940-879c-c62ae4535a01"
    ),
    Conversas(
        "José Renato",
        "Não vai acreditar no que tenho para te contar...",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-36cd8.appspot.com/o/perfil%2Fperfil4.jpg?alt=media&token=ff26db77-6554-4072-a238-f06ba1af4e3d"
    ),
    Conversas(
        "Joao da silva",
        "Curso novo!! depois dá uma olhada!!",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-36cd8.appspot.com/o/perfil%2Fperfil5.jpg?alt=media&token=f6fd2892-f8bd-47bc-b3fc-f0ba0a48fac5"
    ),
  ];





  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listaConversas.length,
        itemBuilder: (context, indice){

          Conversas conversa = listaConversas[indice];

          return ListTile(
            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            leading: CircleAvatar(
              maxRadius: 30,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage( conversa.caminhoFoto ),
            ),
            title: Text(
              conversa.nome,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
            subtitle: Text(
                conversa.mensagem,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14
                )
            ),
          );

        }
    );
  }
}