import 'package:flutter/material.dart';
import 'package:whatsapp_app/Cadastro.dart';
import 'package:whatsapp_app/Configuracoes.dart';
import 'package:whatsapp_app/Login.dart';
import 'package:whatsapp_app/Mensagens.dart';
import 'package:whatsapp_app/Principal.dart';

class RouteGenerator{

  static  const ROUTE_LOGIN = "/login";
  static  const ROUTE_CADASTRO = "/cadastro";
  static  const ROUTE_PRINCIPAL = "/principal";
  static  const ROUTE_CONFIGURACOES = "/Configuracoes";
  static  const ROUTE_MENSAGEM = "/mensagem";


  static Route <dynamic> GeneratorRoute(RouteSettings settings){

    final args = settings.arguments;


    switch(settings.name){

      case "/":
        return MaterialPageRoute(
          builder: (_) => Login()
        );

      case ROUTE_LOGIN:
        return MaterialPageRoute(
            builder: (_) => Login()
        );

      case ROUTE_CADASTRO:
        return MaterialPageRoute(
            builder: (_) => Cadastro()
        );

        case ROUTE_PRINCIPAL:
        return MaterialPageRoute(
            builder: (_) => Principal()
        );

      case ROUTE_CONFIGURACOES:
        return MaterialPageRoute(
            builder: (_) => Configuracoes()
        );

        case ROUTE_MENSAGEM:
        return MaterialPageRoute(
            builder: (_) => Mensagens(args)
        );
      default:
        _erroRota();
    }

  }



  static Route <dynamic> _erroRota(){

    return MaterialPageRoute(

      builder: (_){

        Scaffold(
          appBar: AppBar(title: Text("Tela nao encontrada !!!"),),
          body: Text("Tela nao encontrada"),

        );

      }

    );


  }


}