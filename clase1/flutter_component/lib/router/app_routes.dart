

import 'package:flutter/material.dart';
import 'package:flutter_component/models/models.dart';
import 'package:flutter_component/screens/screens.dart';

class AppRoutes{
  // el static es para poder acceder a esa informacion desde el AppRoutes
  static const initialRoute= 'home';

  static final menuOption= <MenuOption>[
    // MenuOption(route: 'home', icon: Icons.home, name: 'Home Screen', screen: const HomeScreen()),
    MenuOption(route: 'listview1', icon: Icons.list_alt, name: 'List View 1', screen: const ListViewScreen()),
    MenuOption(route: 'listview2', icon: Icons.list, name: 'List View 2', screen: const ListView2Screen()),
    MenuOption(route: 'aler', icon: Icons.campaign, name: 'Alerta', screen: const AlertScreen()),
    MenuOption(route: 'card', icon: Icons.card_travel_outlined, name: 'Card', screen: const CardScreen()),
    MenuOption(route: 'avatar', icon: Icons.supervised_user_circle_outlined, name: 'Circle Avatar', screen: const AvatarScreen()),
    MenuOption(route: 'animated', icon: Icons.play_arrow, name: 'Animated Container', screen: const AnimatedScreen()),
    MenuOption(route: 'input', icon: Icons.input, name: 'Input Text', screen: const InputScreen()),
    MenuOption(route: 'slider', icon: Icons.slideshow_rounded, name: 'Slider Screen', screen: const SliderScreen()),
    MenuOption(route: 'listViewBuilder', icon: Icons.list_outlined, name: 'listView Builder', screen: const ListViewBuilderScreen()),



  ];

  static Map<String, Widget Function(BuildContext)> todasLasRuta(){

    Map<String, Widget Function(BuildContext)> listaDeRutas={};
    listaDeRutas.addAll({'home':(BuildContext context)=> const HomeScreen()});

    for (final i in menuOption){
      listaDeRutas.addAll({
        i.route: (BuildContext context) => i.screen
      });
    }

    return listaDeRutas;
  }
}


// class TodasLasRutas{
//   static Map<String, Widget Function(BuildContext)> todasLasRutas={
    
//         'home': (BuildContext cotext) => const HomeScreen(),
//         'listview1': (BuildContext context)=>const ListViewScreen(),
//         'listview2': (BuildContext context)=>const ListView2Screen(),
//         'aler': (BuildContext context)=>const AlertScreen(),
//         'card': (BuildContext context)=>const CardScreen(),
//       };
  
// }

class RutaError{
  static Route<dynamic> onGenerateRoute (RouteSettings settings){
        return MaterialPageRoute(builder: (context)=>const AlertScreen());
      }
}