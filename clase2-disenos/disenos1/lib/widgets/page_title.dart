import 'package:flutter/material.dart';


class PageTitle extends StatelessWidget {
  const PageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 10,),
            Text('Billetera de Transacciones',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            SizedBox(height: 10,),
            Text('Elige una de las opciones para continuar',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.white))
          ],
        ),
      ),
    );
  }
}