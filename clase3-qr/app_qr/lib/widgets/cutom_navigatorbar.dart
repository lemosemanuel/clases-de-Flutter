import 'package:app_qr/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider=Provider.of<UiProvider>(context);

    final currentIndex=uiProvider.selectedMenuOption;

    return BottomNavigationBar(
      onTap: (int i)=> uiProvider.selectedMenuOption=i, 
      elevation: 0,
      currentIndex: uiProvider.selectedMenuOption,
      items: const[

        BottomNavigationBarItem(
          icon: Icon(Icons.map,),
          label: 'Mapa'
        ),

                BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: 'Direcciones'
        )
      ],
    );
  }
}