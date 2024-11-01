import 'dart:html'; // Necessário para usar elementos HTML no Flutter Web
import 'dart:ui' as ui; // Necessário para o viewType
import 'dart:js' as js;
import 'package:flutter/material.dart';
import '../home/components/bottom_nav_bar.dart';
import '../scan/scan.dart';

class MultipleMarkersMap extends StatelessWidget {
  final String mapId; // Identificador do mapa
  final double latitude;
  final double longitude;
  final List<Map<String, dynamic>>
      locations; // Lista de pontos para os marcadores

  const MultipleMarkersMap({
    super.key,
    required this.mapId,
    required this.latitude,
    required this.longitude,
    required this.locations,
  });

  @override
  Widget build(BuildContext context) {
    // Registra a viewFactory para garantir que o container do mapa seja criado corretamente
    ui.platformViewRegistry.registerViewFactory(mapId, (int viewId) {
      final divElement = DivElement()
        ..id = mapId
        ..style.width = '100%'
        ..style.height = '100%';
      return divElement;
    });

    // Garante que o DOM está pronto antes de chamar initMap com vários marcadores
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        final mapDiv = document.getElementById(mapId);
        if (mapDiv != null) {
          // Converte a lista de pontos em um formato entendível para o JavaScript
          var jsLocations = locations.map((loc) {
            return js.JsObject.jsify({
              'lat': loc['lat'],
              'lng': loc['lng'],
              'title': loc['title'],
            });
          }).toList();

          // Chama o método JavaScript para inicializar o mapa com múltiplos marcadores
          js.context.callMethod('initMap', [
            mapId,
            latitude,
            longitude,
            js.JsObject.jsify(jsLocations), // Passa os pontos
          ]);
        } else {
          print('Erro: Div $mapId não foi encontrado no DOM.');
        }
      });
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove o botão de voltar
        centerTitle: true, // Centraliza o título
        title: const Text(
          'Pontos Próximos de Você',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Negrito no título
            color: Colors.black, // Define a cor do título como preto
          ),
        ),
        elevation: 4, // Sombra suave na base da AppBar
        shadowColor: Colors.black.withOpacity(0.2), // Cor da sombra
        backgroundColor: Colors.white, // Define o fundo da AppBar como branco
        iconTheme: const IconThemeData(
          color: Colors.black, // Define a cor dos ícones como preta
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: HtmlElementView(viewType: mapId), // Mapa em tela cheia
          ),
        ],
      ),
      // Adiciona a BottomNavBar aqui
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1, // O índice do ícone de localização
        onItemTapped: (index) {
          // Lógica de navegação para outras páginas
          if (index == 1) {
            Navigator.pop(context); // Volta para a tela anterior
          } else {
            // Lógica para outras páginas, se necessário
          }
        },
      ),
      // Adicionando o Floating Action Button (FAB) de scan
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Redireciona para a tela de scan
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const Scan(), // Substitua pelo nome da tela de scan, se necessário
            ),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.primary, // Cor do botão
        shape: const CircleBorder(),
        child: const Icon(Icons.fullscreen), // Ícone do botão de scan (QR code)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // FAB centralizado na Bottom Navigation
    );
  }
}
