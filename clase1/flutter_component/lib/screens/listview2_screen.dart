import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  final options= const['Emanuel','juancito','pedrito','josesito'];
   
  const ListView2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("LisView 2"),
        elevation: 5,
        backgroundColor: Colors.indigo,
        ),
      body: ListView.separated(
        itemBuilder: (context, index)=>ListTile(
          title: Text(options[index]),
          trailing:const Icon(Icons.arrow_forward_ios_outlined, color: Colors.indigo,),
          onTap: (){
            final game= options[index];
            print(options[index]);

          } ,
          ), 
        separatorBuilder: (context,index)=>const Divider(), 
        itemCount: options.length)
    );
  }
}