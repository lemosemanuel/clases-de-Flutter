


import 'package:flutter/material.dart';

class AppTheme{
  static const Color primary= Colors.green;

  // vamos con el tema
  static ThemeData greenTheme= ThemeData.light().copyWith(

        // color primario
      primaryColor: primary,

        // appbar
      appBarTheme: const AppBarTheme(
          color: primary,
          elevation: 5,
        ),

      // textButton Theme
      textButtonTheme:TextButtonThemeData(
        style: TextButton.styleFrom(primary: primary)
        ),
      
      // floating action button
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor:primary,
        elevation: 100,
      ),

      // elevatedButtons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
             primary: primary,
             shape: const StadiumBorder(),
             elevation: 5,
        ),
      ),
      
      // vamos con la caja de textos
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(
          color: primary,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primary
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(10)
          )
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primary
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(10)
          )
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topRight: Radius.circular(10))
        )
      ),


      );


}
