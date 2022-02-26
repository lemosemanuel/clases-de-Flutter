
import 'package:flutter/material.dart';

class HombeScreen extends StatelessWidget{
  const HombeScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    const fontSize30= TextStyle(fontSize:30);
    int counter=10;

    return Scaffold(
      // hago el appbar
      appBar: AppBar(
        title: const Text('hola mundo'),
        elevation: 10.0,
      ),
    // hago el body
      body: Center(
        child: Column(
          // alineamiento principal el axis en una columna es vertical
          mainAxisAlignment: MainAxisAlignment.center ,
          // el cossAxisAligment hace el opuesto , osea el horizontal en el caso de ser una columna (pero dentro de la columna vertical)
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  const [
            Text('Numero de clicks',
            style: fontSize30),
            Text('contador',style: fontSize30)
        ],),
      ),
      // hago el botton de abajo
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed:(){
          counter ++;
          print('$counter');
      },),
    );
  }

}