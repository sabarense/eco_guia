import 'package:eco_guia/pages/home/components/custom_header.dart';
import 'package:eco_guia/pages/home/components/home_card.dart';
import 'package:eco_guia/pages/home/components/materiais_section.dart';
import 'package:flutter/material.dart';
import 'package:eco_guia/pages/home/components/bottom_nav_bar.dart';
import 'package:eco_guia/pages/home/components/itens_frequentes_section.dart';
import 'package:eco_guia/pages/home/components/flutter_web_google_maps.dart';
import 'package:eco_guia/pages/scan/scan.dart';
import 'package:eco_guia/pages/locations/multiple_markers_map.dart';
import 'package:eco_guia/pages/profile/profile.dart';
import 'package:eco_guia/pages/learn/learn.dart';
import 'package:eco_guia/services/auth_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  // Função que atualiza o índice selecionado e redireciona para o mapa de múltiplos marcadores
  void _onItemTapped(int index) {
    if (index == 1) {
      // Quando o ícone de localização for clicado
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MultipleMarkersMap(
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
        ),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  // As telas que serão exibidas, dependendo do índice selecionado
  final List<Widget> _pages = [
  // Tela principal (Home)
    const SingleChildScrollView(
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
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Pontos de Coleta',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
            SizedBox(height: 5),
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: FlutterWebGoogleMaps(
              key: Key('map1'),
              mapId: 'map1',
              latitude: -19.9191,
                  longitude: -43.9386),
            ),
            SizedBox(height: 20),
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: FlutterWebGoogleMaps(
              key: Key('map2'),
              mapId: 'map2',
              latitude: -19.9300,
                  longitude: -43.9400),
            ),
            SizedBox(height: 20),
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: FlutterWebGoogleMaps(
              key: Key('map3'),
              mapId: 'map3',
              latitude: -19.9400,
                  longitude: -43.9500),
            ),
            SizedBox(height: 20),
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: FlutterWebGoogleMaps(
              key: Key('map4'),
              mapId: 'map4',
              latitude: -19.9500,
                  longitude: -43.9600),
            ),
            SizedBox(height: 20),
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: FlutterWebGoogleMaps(
              key: Key('map5'),
              mapId: 'map5',
              latitude: -19.9600,
                  longitude: -43.9700),
          ),
            SizedBox(height: 20),
            ItensFrequentesSection(),
            SizedBox(height: 20),
        ],
      ),
    ),
  ),
  // Mapa com múltiplos marcadores
  const MultipleMarkersMap(
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
  const Learn(),
  const Profile(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              title: const Text('Home'),
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false, 
              actions: [
                IconButton(
                  icon: const Icon(Icons.logout, color: Colors.black),
                  onPressed: () {
                    AuthService.logout(context);
                  },
                ),
              ],
            )
          : null, // Nenhum AppBar para outras telas
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Scan()),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: const CircleBorder(),
        child: const Icon(Icons.fullscreen),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
