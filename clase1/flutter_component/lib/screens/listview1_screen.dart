import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  final options= const['Emanuel','juancito','pedrito','josesito'];
   
  const ListViewScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LisView 1"),
        ),
      body: ListView(
        children: [
          // el map lo que regresa un Iterable (algo que pueda ser iterado)
          // utilizo el esprest (...) para extraer cada uno de los elementos
          ...options.map((e) => ListTile(
            title: Text(e),
            trailing:const Icon(Icons.arrow_forward_ios_outlined),
          ),
          ).toList()
        ],
      )
    );
  }
}