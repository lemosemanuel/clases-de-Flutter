import 'package:flutter/material.dart';



class AppTheme{
  static Color primary = Colors.blue.shade900;

  // el theme de la app me pide un ThemeData
  static ThemeData myAppTheme= ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme:  AppBarTheme(
      color: primary,
      elevation: 10
    )
  );

}