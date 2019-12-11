import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_app/RouteGenerator.dart';
import 'package:whatsapp_app/telas/abaContatos.dart';
import 'package:whatsapp_app/telas/abaConversas.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}



class _PrincipalState extends State<Principal> with SingleTickerProviderStateMixin {
    TabController _tabController;

    List<String> itensMenu = ["Configuraçoes","Deslogar"];


    Future _verificaUsuarioLogado() async{

      FirebaseAuth auth = FirebaseAuth.instance;

      FirebaseUser user = await auth.currentUser();

      if(user == null){

        Navigator.pushNamed(context, RouteGenerator.ROUTE_LOGIN);


      }
    }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verificaUsuarioLogado();
    _tabController = TabController(length: 2, vsync: this);
  }



  void _deslogarUsuario(){


      FirebaseAuth auth = FirebaseAuth.instance;
      auth.signOut();
      Navigator.pop(context);

  }

  void _escolhaMenuItem(String item){

      switch(item){
        case "Configuraçoes":
          Navigator.pushNamed(context, RouteGenerator.ROUTE_CONFIGURACOES);
          break;
        case "Deslogar":
          _deslogarUsuario();
          break;
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whats App"),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 4,
            labelStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(text:"Coversas"),
              Tab(text: "Contatos",)

            ]),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: _escolhaMenuItem ,
              itemBuilder: (context){
                return itensMenu.map((String item){
                  return PopupMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList();

              },


            )
          ],
      ),

      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          abaConversas(),
          abaContatos()
        ],
      ),
    );
  }
}
