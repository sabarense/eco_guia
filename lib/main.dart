import 'package:flutter/material.dart';
import 'pages/tabs/home.dart';
import 'pages/tabs/tela_1.dart';
import 'pages/tabs/tela_2.dart';
import 'pages/tabs/tela_3.dart';
import 'pages/tabs/tela_4.dart';
import 'pages/tabs/login.dart';
import 'pages/tabs/register.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eco Guia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          primary: const Color(0xFF185A46),
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          headlineLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => const Home(),
        '/location': (context) => const Tela1(),
        '/learn': (context) => const Tela2(),
        '/profile': (context) => const Tela3(),
        '/scan': (context) => const Tela4(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
      },
    );
  }
}
