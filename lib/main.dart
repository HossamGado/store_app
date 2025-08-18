import 'package:flutter/material.dart';

void main(){
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(
        title: Text("KAKA"),
      ),),
    );
  }
}