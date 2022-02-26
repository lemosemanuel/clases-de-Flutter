import 'package:flutter/material.dart';
import 'package:flutter_component/router/app_routes.dart';
import 'package:flutter_component/theme/app_theme.dart';
// import 'package:flutter_component/screens/screens.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Componentes en Fluter'),
        elevation: 5,
        ),
      body: ListView.separated(
        itemBuilder: (context,index)=>ListTile(
          leading: Icon(AppRoutes.menuOption[index].icon,color: AppTheme.primary,),
          title: Text(AppRoutes.menuOption[index].name),
          onTap: (){
            // final route = MaterialPageRoute(builder: (context)=> const ListViewScreen());
            // el push replacement borra el volver para atras (itil para un login)
            // Navigator.pushReplacement(context, newRoute)
            // Navigator.push(context, route);  este es el comun
            Navigator.pushNamed(context, AppRoutes.menuOption[index].route);
          },
        ), 
        separatorBuilder: (_,__)=>Divider(),
        itemCount: AppRoutes.menuOption.length
        
      )
    );
  }
}