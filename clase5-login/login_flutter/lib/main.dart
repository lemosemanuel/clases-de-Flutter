import 'package:flutter/material.dart';
import 'package:login_flutter/screens/register_screen.dart';
import 'package:login_flutter/screens/screen.dart';
import 'package:login_flutter/services/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());


class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ProductsService(),),
        ChangeNotifierProvider(create: (_)=>AuthService(),)

      ],
      child: MyApp(),
      );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos',
      initialRoute:'checking',
      routes: {
        'home':(BuildContext context)=> HomeScreen(),
        'register':(BuildContext context)=> RegisterScreen(),
        'login':(BuildContext context)=> LoginScreen(),
        'product':(BuildContext context)=> ProductScreen(),
        'checking':(_)=> CheckAuthScreen()

      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(elevation: 0,color: Colors.indigo),
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.indigo,elevation: 0)
      ),
    );
  }
}