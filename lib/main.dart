import 'package:flutter/material.dart';
import 'dart:ui'
    as ui; // Import necessário para registrar ViewFactory no Flutter Web
import 'dart:html'; // Necessário para usar elementos HTML no Flutter Web
import 'pages/home/home.dart';
import 'pages/tabs/tela_1.dart';
import 'pages/learn/learn.dart';
import 'pages/locations/multiple_markers_map.dart'; // Importando o MultipleMarkersMap
import 'pages/tabs/tela_3.dart';
import 'pages/tabs/tela_4.dart';
import 'pages/rewards/rewards.dart'; // Import da tela genérica

void main() {
  // Registrar o elemento HTML 'map' para uso no Flutter Web
  ui.platformViewRegistry.registerViewFactory(
    'map',
    (int viewId) => DivElement()..id = 'map',
  );

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
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/location': (context) => const MultipleMarkersMap(
              mapId: 'full-map',
              latitude: -19.9191,
              longitude: -43.9386,
              locations: [
                {'lat': -19.9191, 'lng': -43.9386, 'title': 'Ponto 1'},
                {'lat': -19.9300, 'lng': -43.9400, 'title': 'Ponto 2'},
                {'lat': -19.9400, 'lng': -43.9500, 'title': 'Ponto 3'},
                {'lat': -19.9500, 'lng': -43.9600, 'title': 'Ponto 4'},
                {'lat': -19.9600, 'lng': -43.9700, 'title': 'Ponto 5'},
              ],
            ),
        '/learn': (context) => const Tela2(),
        '/profile': (context) => const Tela3(),
        '/scan': (context) => const Tela4(),
        '/rewards': (context) => const Rewards(),
      },
    );
  }
}
