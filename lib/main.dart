import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/tela_1.dart';
import 'screens/tela_2.dart';
import 'screens/tela_3.dart';
import 'screens/tela_4.dart';

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple, // Cor semente
          primary: const Color(0xFF185A46), // Definindo cor primária
        ),
        useMaterial3: true,
        // Adicionando a fonte Poppins ao tema
        fontFamily: 'Poppins', // Define 'Poppins' como a fonte padrão
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          headlineLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
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
