import 'package:flutter/material.dart';
import '../home/components/bottom_nav_bar.dart';
// Importe o arquivo correto onde BottomNavBar está definido

class Scan extends StatelessWidget {
  const Scan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Centraliza o título
        title: const Text(
          'Scan',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Negrito no título
            color: Colors
                .black, // Define a cor do título como preto para contraste
          ),
        ),
        elevation: 4, // Sombra suave na base da AppBar
        shadowColor: Colors.black.withOpacity(0.2), // Cor da sombra
        backgroundColor: Colors.white, // Define o fundo da AppBar como branco
        iconTheme: const IconThemeData(
          color: Colors.black, // Define a cor dos ícones como preta
        ),
      ),
      body: Center(
        child: Image.asset(
          'assets/scan_mockup.png', // Caminho da sua imagem
          fit: BoxFit.cover, // Ajusta a imagem para preencher 100% da tela
          width: double.infinity,
          height: double.infinity,
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0, // Escolha um índice para a barra
        onItemTapped: (index) {
          // Navegação para outras páginas pode ser implementada aqui
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Defina a função que deseja aqui (pode ser outra ação)
          print('Floating Action Button Clicado na Tela de Imagem');
        },
        backgroundColor: Theme.of(context).colorScheme.primary, // Cor do botão
        shape: const CircleBorder(),
        child: const Icon(Icons.camera_alt), // Ícone do botão
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
