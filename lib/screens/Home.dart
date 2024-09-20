// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'components/home_card.dart'; // Importa o componente de card
import 'components/bottom_nav_bar.dart'; // Importa a barra de navegação
import 'components/materiais_section.dart'; // Importa a seção de materiais
import 'components/custom_header.dart'; // Importa o cabeçalho customizado
import 'components/itens_frequentes_section.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeader(),
                SizedBox(height: 20),
                HomeCard(),
                SizedBox(height: 20),
                MateriaisSection(),
                SizedBox(height: 20),
                ItensFrequentesSection(),
                SizedBox(height: 20),
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
