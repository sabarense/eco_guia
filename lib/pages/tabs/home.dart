import 'package:flutter/material.dart';
import '../components/home_card.dart'; // Importa o componente de card
import '../components/bottom_nav_bar.dart'; // Importa a barra de navegação
import '../components/materiais_section.dart'; // Importa a seção de materiais
import '../components/custom_header.dart'; // Importa o cabeçalho customizado
import '../components/itens_frequentes_section.dart';
import '../components/flutter_web_google_maps.dart'; // Importa o componente de Google Maps

// Outras telas que você deseja exibir quando os ícones da navbar forem clicados
import 'tela_1.dart'; // Exemplo de tela 1
import 'tela_2.dart'; // Exemplo de tela 2
import 'tela_3.dart'; // Exemplo de tela 3
import 'tela_4.dart'; // Exemplo de tela 4

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  // Função que atualiza o índice selecionado
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // As telas que serão exibidas, dependendo do índice selecionado
  final List<Widget> _pages = [
    // Tela principal (Home)
    SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alinhamento no eixo principal
          children: [
            const CustomHeader(),
            const SizedBox(height: 20),
            const HomeCard(),
            const SizedBox(height: 20),
            const MateriaisSection(),
            const SizedBox(height: 20),
            const FlutterWebGoogleMaps(), // Mapa do Google
            const SizedBox(height: 20),
            const ItensFrequentesSection(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ),
    const Tela1(), // Outra tela que será exibida ao clicar no segundo ícone
    const Tela2(), // Outra tela para o terceiro ícone
    const Tela3(), // Outra tela para o quarto ícone
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex, // Exibe a tela baseada no índice
          children: _pages, // Telas
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex, // Passa o índice selecionado
        onItemTapped: _onItemTapped, // Função para lidar com toques
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton clicado!');
        },
        backgroundColor: Theme.of(context).colorScheme.primary, // Cor do botão
        shape: const CircleBorder(), // Formato redondo
        child: const Icon(Icons.fullscreen), // Ícone central
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
