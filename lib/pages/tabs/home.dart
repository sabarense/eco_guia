import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Importa shared_preferences
import '../components/home_card.dart'; // Importa o componente de card
import '../components/bottom_nav_bar.dart'; // Importa a barra de navegação
import '../components/materiais_section.dart'; // Importa a seção de materiais
import '../components/custom_header.dart'; // Importa o cabeçalho customizado
import '../components/itens_frequentes_section.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false); // Remove o status de login
    Navigator.pushReplacementNamed(context, '/login'); // Redireciona para a tela de login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black,),
            onPressed: () {
              _logout(context);
            },
          ),
        ],
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Adicionando o CustomHeader acima do HomeCard
                CustomHeader(),
                SizedBox(height: 20),
                HomeCard(),
                SizedBox(height: 20),

                // Adicionando a sessão de Materiais
                MateriaisSection(),
                SizedBox(height: 20),
                ItensFrequentesSection(),
                SizedBox(height: 20), // Espaço extra se necessário
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(), // Barra de navegação inferior
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ação ao clicar no botão central
          print('FloatingActionButton clicado!');
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: const CircleBorder(), // Garantir que seja redondo
        child: const Icon(Icons.fullscreen), // Ícone central
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
