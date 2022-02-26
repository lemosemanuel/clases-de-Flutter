import 'package:flutter/material.dart';


class CustomInputField extends StatelessWidget {
  // siempre en el constructor pido los parametros
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboarInputType;
  final bool isPasword;

  // campos obligatorios
  final String formProperty;
  final Map<String,String>formValues;

  
  const CustomInputField({
    Key? key, 
    this.hintText, 
    this.labelText, 
    this.helperText, 
    this.icon, 
    this.suffixIcon, 
    this.keyboarInputType, 
    this.isPasword =false, 
    required this.formProperty, 
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null) return 'este campo es requerido';
        return value.length <3 ? 'minimo 3 letras':null;
      },
      // disparo el validador con el autovalidateMode
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofocus: false,
      // initialValue: "escriba aqui",
      // si quiero que se capitalice automaticamente
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboarInputType==null?null: keyboarInputType,
      obscureText: isPasword,


      onChanged: (value){
        formValues[formProperty]=value;
      },
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        counterText: '3 caracteres',
        prefixIcon: icon== null?null:Icon(icon),
        suffixIcon:suffixIcon ==null?null: Icon(suffixIcon),


        // esto lo voy a poner en app_theme 
        
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.only(
        //     bottomLeft: Radius.circular(10),
        //     topRight: Radius.circular(10),
        //     )
        // )
         ),
    );
  }
}