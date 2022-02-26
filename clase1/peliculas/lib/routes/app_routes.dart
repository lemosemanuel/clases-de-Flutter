import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/screen/screen.dart';



class AppRoutes{
  static const initialRoute = 'home';
  static final menuOption= <MenuOption>[
    // MenuOption(route: 'home',icon: Icons.home,name: 'home page',screen: const HomeScreen()),
    MenuOption(route: 'details',icon: Icons.home,name: 'Details page',screen: const DetailesScreen()),

  ];

  static Map<String,Widget Function(BuildContext)> todasLasRutas(){
    Map<String, Widget Function(BuildContext)> listaDeRutas={};
    listaDeRutas.addAll({'home':(BuildContext context)=> const HomeScreen()});

    for (final i in menuOption){
      listaDeRutas.addAll({i.route: (BuildContext context)=>i.screen});
    }

    return listaDeRutas;
  }
}

class RutaError{
    static Route<dynamic> onGenerateRoute (RouteSettings settings){
        return MaterialPageRoute(builder: (context)=>const AlertScreen());
      }
}