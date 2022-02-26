import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
   
  const ScrollScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: const BoxDecoration(
          gradient:LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.5,0.5
            ],
            colors: [
              Color(0xff5EE8C5),
              Color(0xff30BAD6)
          ]) 
        ),
        child: PageView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children:const[
            Page1(),
            Page2(),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),

      child: Center(
        child: TextButton(
          onPressed: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal:40),
            child: Text('Bienvenido',style: TextStyle(color: Colors.white,fontSize: 30),)),
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: const StadiumBorder()
          ),
          
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Background(),
        MainContent()
      ],
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 60,fontWeight: FontWeight.bold,color: Colors.white);
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30,),
          const Text('11^',style: textStyle,),
          const Text('Miercoles',style: textStyle,),
          Expanded(child: Container()),
          const Icon(Icons.keyboard_arrow_down,size: 100,color: Colors.white,)
    
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff30BAD6),
      // ubico la imagen arriba
      alignment: Alignment.topCenter,
      // el conteiner esta predeterminado por el tamano de la imagen, pero puedo poner infinity para que sea mas grande
      height: double.infinity,
      child: const Image(image: AssetImage('assets/scroll-1.png'))
    
    );
  }
}