import 'package:disenos1/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'complex_desing',
      theme: ThemeData.dark(),
      routes: {
        'basic_desing':(BuildContext constext)=> const BasicDisengScreen(),
        'scroll':(BuildContext context)=>const ScrollScreen(),
        'complex_desing':(BuildContext context)=> const ComplexDesingScreen()
      },
    );
  }
}