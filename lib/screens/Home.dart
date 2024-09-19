import 'package:flutter/material.dart';
import 'components/home_card.dart'; // Importa o componente de card
import 'components/bottom_nav_bar.dart'; // Importa a barra de navegação

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const HomeCard(),
                const SizedBox(height: 20),
                const Text(
                  'Bem-vindo à Home Page',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(), // Barra de navegação inferior
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
