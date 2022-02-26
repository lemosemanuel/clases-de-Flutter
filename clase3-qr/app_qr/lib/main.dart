import 'package:app_qr/providers/scan_list_provider.dart';
import 'package:app_qr/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_qr/pages/pages.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (BuildContext context)=> new UiProvider()),
        ChangeNotifierProvider(create: (BuildContext context)=> new ScanListProvider()),

      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home':(BuildContext context)=>const HomeScreen(),
          'mapa':(BuildContext context)=>const MapaScreen()
        },
        theme: ThemeData(
          primaryColor: Colors.deepOrange,
          appBarTheme: const AppBarTheme(color: Colors.green),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.blue)
        )
      ),
    );
  }
}