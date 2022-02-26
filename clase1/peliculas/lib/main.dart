import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/routes/app_routes.dart';
import 'package:peliculas/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

// en simples palabras lo primero que hago es llamar al Provider antes que al MyApp
class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>MoviesProvider(),lazy: false,)
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.todasLasRutas(),
      onGenerateRoute:(settings)=>RutaError.onGenerateRoute(settings),
      theme: AppTheme.myAppTheme
    );
  }
}