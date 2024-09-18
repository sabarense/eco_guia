// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'components/bottom_nav_bar.dart'; // Importa o componente de navegação

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home Page',
          style: const TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar:
          const BottomNavBar(), // Usa o componente de navegação aqui
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ação ao clicar no botão central
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.fullscreen),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
