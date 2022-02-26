import 'package:flutter/material.dart';


class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // showSelectedLabels: false,
      // showUnselectedLabels: false,
      selectedItemColor: Colors.pink,
      backgroundColor: const Color.fromRGBO(55, 57, 84, 1),
      unselectedItemColor: const Color.fromRGBO(116, 117, 152, 1),
      currentIndex: 0,
      items: const [

        BottomNavigationBarItem(
          icon: Icon(Icons.transform_rounded),
          label: 'Transferencias'
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on_outlined),
          label: 'Dinero'
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: 'Billetera'
        ),
      ]
    );
  }
}