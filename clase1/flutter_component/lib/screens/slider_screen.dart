import 'package:flutter/material.dart';
import 'package:flutter_component/theme/app_theme.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _SliderValue=100;
  bool _sliderEnabled= true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Slider(
            min: 20,
            max: 1000,
            activeColor: AppTheme.primary,
            divisions: 10,
            value: _SliderValue,
            // condiciono el slider de abajo con este checkbok... si lo habilito puedo cambiarlo , sino no
            onChanged: _sliderEnabled?
             (value){
              // redibujo el valor para que aparezca en la pantalla
              
              _SliderValue=value;
              setState(() {
              });
            }:null
            ),

            Checkbox(
              value: _sliderEnabled, 
              onChanged: (value){
                _sliderEnabled = value?? true;
                setState(() {
                  
                });
              }
              ),
              
              // es lo mismo pero puedo tocar en cualquier lado
              CheckboxListTile(
                activeColor: AppTheme.primary,
                title: const Text('Habilitar Slider'),
                value: _sliderEnabled, 
                onChanged: (value){
                _sliderEnabled=value??true;
                setState(() {
                  
                });
              }),

              // este es un switch (podes tocar en cualquier lado), esta el Switch seria equivalente a Checkbox
              SwitchListTile(
                activeColor: AppTheme.primary,
                title: const Text('Activar Slider'),
                value: _sliderEnabled, 
                onChanged: (value){
                _sliderEnabled=value;
                setState(() {
                });
              }),



            Expanded(
              child: SingleChildScrollView(
                child: Image(
                  image: const NetworkImage('https://www.surfcanarias.com/wp-content/uploads/2020/05/Equipamientos-para-Surf-scaled.jpg'),
                  width:_SliderValue,
                  // height: _SliderValue,
                  fit: BoxFit.contain,
                  ),
              ),
            ),
              // dejo un espacio para que no toque el fondo
              const SizedBox(height: 50,)
        ],
      )
    );
  }
}