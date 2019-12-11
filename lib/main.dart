import 'package:flutter/material.dart';
import 'package:whatsapp_app/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_app/Login.dart';
import 'package:whatsapp_app/RouteGenerator.dart';
void main(){



  
  runApp(MaterialApp(
    home: Login(),
    onGenerateRoute: RouteGenerator.GeneratorRoute,
    theme: ThemeData(primaryColor: Color(0xff075E54),
                     accentColor: Color(0xff25D366)),
  ));

}
