import 'dart:html'; // Necessário para usar elementos HTML no Flutter Web
import 'dart:ui' as ui; // Necessário para o viewType
import 'dart:js' as js;
import 'package:flutter/material.dart';

class FlutterWebGoogleMaps extends StatelessWidget {
  final String mapId; // Identificador do mapa
  final double latitude;
  final double longitude;

  const FlutterWebGoogleMaps({
    super.key,
    required this.mapId,
    required this.latitude,
    required this.longitude,
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

    // Garante que o DOM está pronto antes de chamar initMap
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        final mapDiv = document.getElementById(mapId);
        if (mapDiv != null) {
          js.context.callMethod('initMap',
              [mapId, latitude, longitude]); // Passa o ID e as coordenadas
        } else {
          print('Erro: Div $mapId não foi encontrado no DOM.');
        }
      });
    });

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          // Mapa
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              width: 120, // Defina a largura do mapa
              height: 120, // Defina a altura do mapa
              child: HtmlElementView(
                viewType: mapId, // Usa o identificador único
              ),
            ),
          ),
          const SizedBox(width: 16), // Espaço entre o mapa e o conteúdo

          // Informações do ponto de coleta
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '150m | 3 min.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'PUC Minas - Entrada 4',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '30% de espaço restante',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),

                // Materiais aceitos
                Row(
                  children: [
                    _MaterialInfo(label: 'Plástico', color: Colors.orange),
                    SizedBox(width: 16),
                    _MaterialInfo(label: 'Papel', color: Colors.purple),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Componente auxiliar para exibir os materiais
class _MaterialInfo extends StatelessWidget {
  final String label;
  final Color color;

  const _MaterialInfo({
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: color,
          ),
        ),
      ],
    );
  }
}
