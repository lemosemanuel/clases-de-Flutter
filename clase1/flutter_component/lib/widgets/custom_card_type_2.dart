import 'package:flutter/material.dart';
import 'package:flutter_component/theme/app_theme.dart';


class CustomCardType2 extends StatelessWidget {

  final String imagenUrl;
  final String? name;

  const CustomCardType2({Key? key, required this.imagenUrl, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 10,
      shadowColor: AppTheme.primary.withOpacity(0.5),
      child: Column(
        children:  [
          FadeInImage (
            image: NetworkImage(imagenUrl),
            placeholder: const AssetImage('assets/jar-loading.gif') ,
            width: double.infinity,
            height: 370,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
            ),


            // en dart se pueden poner condiciones a los arreglos
            if (name !=null)
              Container(
                alignment: AlignmentDirectional.centerEnd,
                padding: const EdgeInsets.only(right:20,top: 10, bottom: 10),
                child: Text(name!),
                )
        ],
      ),
    );
  }
}