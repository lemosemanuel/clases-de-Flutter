import 'package:flutter/material.dart';
// import 'package:flutter_component/theme/app_theme.dart';
import 'package:flutter_component/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Card Widget"),),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10
        ),
        children: const  [
          // hago una tarjeta
          CustomCardType1(),
          SizedBox(height: 10,),
          CustomCardType2(
            imagenUrl: 'https://www.wallpapertip.com/wmimgs/26-263768_mountain-landscapes-wallpaper-iphone.jpg',
            name: 'un hermoso paisaje',
          ),
          SizedBox(height: 10,),
          CustomCardType2(
            imagenUrl: 'https://www.wallpapertip.com/wmimgs/26-263768_mountain-landscapes-wallpaper-iphone.jpg',
            name: null,),
          SizedBox(height: 10,),
          CustomCardType2(imagenUrl: 'https://www.wallpapertip.com/wmimgs/26-263768_mountain-landscapes-wallpaper-iphone.jpg',)
        ],)
    );
  }
}
