import 'package:flutter/material.dart';
import 'components/home_card.dart';
import 'components/bottom_nav_bar.dart';
import 'components/materiais_section.dart';
import 'components/custom_header.dart';
import 'components/itens_frequentes_section.dart';
import 'components/flutter_web_google_maps.dart';

// Outras telas que você deseja exibir quando os ícones da navbar forem clicados
import '../tabs/tela_1.dart';
import '../learn/learn.dart';
import '../tabs/tela_3.dart';
import '../tabs/tela_4.dart';

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
    const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alinhamento no eixo principal
          children: [
            CustomHeader(),
            SizedBox(height: 20),
            HomeCard(),
            SizedBox(height: 20),
            MateriaisSection(),
            SizedBox(height: 20),

            // Adicionando o título "Pontos de Coleta" com margens laterais
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0), // Margem lateral
              child: Text(
                'Pontos de Coleta',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5),

            // Mapa 1 com margens laterais
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: FlutterWebGoogleMaps(
                  key: Key('map1'), // Chave única para cada instância
                  mapId: 'map1',
                  latitude: -19.9191,
                  longitude: -43.9386),
            ),
            SizedBox(height: 20),

            // Mapa 2 com margens laterais
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: FlutterWebGoogleMaps(
                  key: Key('map2'),
                  mapId: 'map2',
                  latitude: -19.9300,
                  longitude: -43.9400),
            ),
            SizedBox(height: 20),

            // Mapa 3 com margens laterais
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: FlutterWebGoogleMaps(
                  key: Key('map3'),
                  mapId: 'map3',
                  latitude: -19.9400,
                  longitude: -43.9500),
            ),
            SizedBox(height: 20),

            // Mapa 4 com margens laterais
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: FlutterWebGoogleMaps(
                  key: Key('map4'),
                  mapId: 'map4',
                  latitude: -19.9500,
                  longitude: -43.9600),
            ),
            SizedBox(height: 20),

            // Mapa 5 com margens laterais
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: FlutterWebGoogleMaps(
                  key: Key('map5'),
                  mapId: 'map5',
                  latitude: -19.9600,
                  longitude: -43.9700),
            ),
            SizedBox(height: 20),

            // Seção de itens frequentes
            ItensFrequentesSection(),
            SizedBox(height: 20),
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
