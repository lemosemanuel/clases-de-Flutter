import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_component/theme/app_theme.dart';

class AlertScreen extends StatelessWidget {
   
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIOS (BuildContext context){
    showCupertinoDialog(
      context: context, 
      builder: (context)=> CupertinoAlertDialog(
        title: const Text("Titulo"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("este es el contenido de la alerta"),
            SizedBox(height:10),
            FlutterLogo(size: 1000,)
          ],
        ),
        actions: [
            TextButton(
              onPressed: ()=> Navigator.pop(context), 
              child: const Text("Cancelar",style: TextStyle(color: Colors.red),)
              ),
            TextButton(
              onPressed: ()=> Navigator.pop(context), 
              child: const Text("Aceptar")
              )
          ],
      ));
  }

  // necesito que me manden el build context ya que el showDialog necesita el context
  void displayDialogAndroid(BuildContext context){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(10)),
          title: const Text("titulo"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text("este es el contenido de la alerta"),
              SizedBox(height:10),
              FlutterLogo(size: 100,)
            ],
          ),
          actions: [
            TextButton(
              onPressed: ()=> Navigator.pop(context), 
              child: const Text("Cancelar")
              ),
            TextButton(
              onPressed: ()=> Navigator.pop(context), 
              child: const Text("Aceptar")
              )
          ],
        );
      }
      );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: ElevatedButton(
           onPressed: (){

            //  determino la plataforma Android o IOS
            return Platform.isAndroid? displayDialogAndroid(context): displayDialogIOS(context);
            // return displayDialogAndroid(context);
            // return displayDialogIOS(context);
           }, 
           child: const Padding(
             padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
             child:  Text('Mostrar alerta',style: TextStyle(fontSize: 20),),
           ),
          //  style:ElevatedButton.styleFrom(
          //    primary: AppTheme.primary,
          //    shape: const StadiumBorder(),
          //    elevation: 5,
          //  ) ,
           ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          // hago que me devuelva a la pantalla anterior
          Navigator.pop(context);
        },
        child: const Icon(Icons.close),
        
        ),
    );
  }
}