import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'pages/tabs/tela_1.dart';
import 'pages/tabs/tela_2.dart';
import 'pages/tabs/tela_3.dart';
import 'pages/tabs/tela_4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Define as rotas da aplicação
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/tela1': (context) => const Tela1(),
        '/tela2': (context) => const Tela2(),
        '/tela3': (context) => const Tela3(),
        '/tela4': (context) => const Tela4(),
      },
    );
  }
}
