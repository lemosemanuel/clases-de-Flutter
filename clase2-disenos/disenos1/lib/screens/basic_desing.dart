import 'dart:ui';

import 'package:flutter/material.dart';

class BasicDisengScreen extends StatelessWidget {
   
  const BasicDisengScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [ 

          const Image(
            image: AssetImage('assets/surfing1.jpg')
          ),

          const Title(),
          const ButtonSection(),
          Container(
            margin:const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
            child:const Text('Sint consectetur nulla cillum reprehenderitExercitatnsectetur nulla casdsaMollit amet fugiat ut deserunt laborum adipisicing minim velit duis dolore aliquip sunt laboris.dsadasd as dsa d sad sa d sa dsadsa d sa d sad sad sad sad sa d saillum reprehenderitExercitatnsectetur nulla cillum reprehenderitExercitatnsectetur nulla cillum reprehenderiasdasd as dsa d sad sa d sadastExercitatnsectetur nulla cillum reprehenderitExercitatnsectetur nulla cillum reprehenderitExercitatnsectet nulla cillum reprehender cillum reprehenderitExercitatnsectetur nulla cillum reprehenderitExercitatnsectetur nulla cillum reprehenderitExercitatnsectetur nulla cillum reprehenderitExercitation nElit esse aliqua nostrud id excepteur nostrud veniam eiusmod et cillum culpa fugiat.isi non tempor labore incididunt exercitation consectetur. veniam minim eu deserunt sunt aliqua LQui laboris dolor cillum adipisicing.orem mollit consectetur ea amet.culpa commodo.')
          )
        ]
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:const [
          ButtonSectionButtons(icono: Icons.call,texto: 'Call',color: Colors.blue,),
          ButtonSectionButtons(icono: Icons.alt_route,texto: 'Route',color: Colors.blue),
          ButtonSectionButtons(icono: Icons.share,texto: 'Share',color: Colors.blue),

        ],
        ),
    );
  }
}

class ButtonSectionButtons extends StatelessWidget {
  final IconData icono;
  final String texto;
  final Color color;
  
  const ButtonSectionButtons({
    Key? key, required this.icono, required this.texto, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icono,size: 30,color: Colors.blue,),
        const SizedBox(height: 10,),
        Text(texto,style: TextStyle(fontSize:20,color: color,fontWeight: FontWeight.bold),),
      ],
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: const [
              Text('Surfing es una forma diferente de vivir',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Foto tomada en las playas de indonecia',style: TextStyle(color: Colors.black),),
            ],
          ),
          Expanded(
            child: Container(
            // marco con color para ver que expanded estoy utilizando
            // color:Colors.red
            height: 10,),
            ),
          const Icon(Icons.star,color:Colors.red),
          const Text('41')
        ],
      ),
    );
  }
}