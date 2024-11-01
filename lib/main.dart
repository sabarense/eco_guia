import 'package:eco_guia/pages/scan/scan.dart';
import 'package:flutter/material.dart';
import 'package:eco_guia/pages/home/home.dart';
import 'package:eco_guia/pages/tabs/login.dart';
import 'package:eco_guia/pages/tabs/register.dart';
import 'package:eco_guia/pages/learn/learn.dart';
import 'package:eco_guia/pages/locations/multiple_markers_map.dart';
import 'package:eco_guia/pages/rewards/rewards.dart';
import 'package:eco_guia/pages/tabs/tela_3.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:eco_guia/pages/tabs/welcome_screen.dart';

void main() {
  // databaseFactory = databaseFactoryFfi;
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
        '/': (context) => const WelcomeScreen(),  
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
        '/home': (context) => const Home(),
        '/learn': (context) => const Learn(),
        '/profile': (context) => const Profile(),
        '/scan': (context) => const Scan(),
        '/rewards': (context) => const Rewards(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
      },
    );
  }
}
