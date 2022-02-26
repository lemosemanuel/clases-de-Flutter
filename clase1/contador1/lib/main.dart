import 'package:flutter/material.dart';
import 'package:my_app/screens/counter_screen.dart';
import 'package:my_app/screens/home_screen.dart';

void main(){
  // creo un widget
  runApp(const MayApp());
}

// defino el widget (es como una clase extendida de un StatefullWidget o StatefullWidget)
class MayApp extends StatelessWidget{
  const MayApp({Key? key}) : super(key: key);

  // todo StatelessWidget tiene un metodo build
  @override 
  Widget build (BuildContext context){
    // como de material app no voy a cambiar nada lo defino como una constante
    return  const MaterialApp(
      // saco el baner de arriba
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
      // home: HombeScreen()
    );
  }

}