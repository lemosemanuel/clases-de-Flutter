import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
   
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double _width=50;
  double _height= 50;
  Color _color= Colors.indigo;
  BorderRadiusGeometry _borderRadius= BorderRadius.circular(10);


  void cambioAlApretar(){
    final random=Random();
    _width= random.nextInt(300).toDouble()+70;
    _height= random.nextInt(300).toDouble() + 70;
    _borderRadius= BorderRadius.circular(random.nextInt(100).toDouble());
    // _borderRadius=BorderRadius.circular(random.nextInt(100));
    _color= Color.fromRGBO(
       random.nextInt(230),
       random.nextInt(255),
       random.nextInt(255),
       random.nextInt(255).toDouble(),
    );

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("animated container"),
      ),
      body: Center(
         child: AnimatedContainer(
           width: _width,
           height: _height,
          //  color:Colors.red
          decoration: BoxDecoration(
             color: _color,
             borderRadius: _borderRadius
             ), 
          duration: const Duration(milliseconds:500),
          curve: Curves.easeOutCubic,
         ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_circle_fill),
        onPressed: (){
          cambioAlApretar();
        },
        ),
    );
  }
}