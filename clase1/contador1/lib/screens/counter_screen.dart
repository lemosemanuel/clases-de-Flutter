
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget{
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  // lo coloco como una propiedad aca arriba
  int counter=10;

  // hago un metodo (una funcion que esta dentro del estate)
  void increase(){
    counter++;
    setState(() {
    });
  }

  void decrease(){
    counter--;
    setState(() {
    });
  }
  
  void reset(){
    counter=0;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    const fontSize30= TextStyle(fontSize:30);

    return Scaffold(
      // hago el appbar
      appBar: AppBar(
        title: const Text('Counter Screen'),
        elevation: 10.0,
      ),
    // hago el body
      body: Center(
        child: Column(
          // alineamiento principal el axis en una columna es vertical
          mainAxisAlignment: MainAxisAlignment.center ,
          // el cossAxisAligment hace el opuesto , osea el horizontal en el caso de ser una columna (pero dentro de la columna vertical)
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const Text('Numero de clicks',
            style: fontSize30),
            Text('$counter',style: fontSize30)
        ],),
      ),
      // hago el botton de abajo
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingAction(
        increaseFunction: increase,
        decreaseFunction: decrease,
        restartFunction: reset,
        ),
    );
  }
}







class CustomFloatingAction extends StatelessWidget {


  final Function increaseFunction;
  final Function decreaseFunction;
  final Function restartFunction;



  const CustomFloatingAction({
    Key? key,
    required this.increaseFunction,
    required this.decreaseFunction,
    required this.restartFunction,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.baseline,
      children:  [
        FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed:()=>increaseFunction(),
          ),

        // SizedBox(width: 20,),
        FloatingActionButton(
          child: const Icon(Icons.restore),
          onPressed:()=> decreaseFunction(),
        ),
        // SizedBox(width: 20,),
        FloatingActionButton(
          child: const Icon(Icons.exposure_minus_1),
          onPressed: ()=> restartFunction(),
        ),
      ],
    );
  }
}