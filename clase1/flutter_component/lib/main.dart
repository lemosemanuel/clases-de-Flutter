import 'package:flutter/material.dart';
import 'package:flutter_component/router/app_routes.dart';
import 'package:flutter_component/theme/app_theme.dart';

// hago un barred (un barril) de importaciones
import 'screens/screens.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // home: const ListView2Screen(),
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.todasLasRuta(),
        // en el caso de no encontrar la ruta lo mando a una pagina de alerta
      onGenerateRoute:(settings)=>RutaError.onGenerateRoute(settings),

      // tema de la app
      // theme: ThemeData.dark(),
      theme: AppTheme.greenTheme,

    );
  }
}