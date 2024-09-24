import 'dart:html'; // Necessário para usar elementos HTML no Flutter Web
import 'dart:js' as js;
import 'package:flutter/material.dart';

class FlutterWebGoogleMaps extends StatelessWidget {
  const FlutterWebGoogleMaps({super.key});

  @override
  Widget build(BuildContext context) {
    // Garante que o DOM está pronto antes de chamar initMap
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        final mapDiv = document.getElementById('map');
        if (mapDiv != null) {
          js.context
              .callMethod('initMap'); // Inicializa o Google Maps via JavaScript
        } else {
          print('Erro: Div map não foi encontrado no DOM.');
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
            borderRadius:
                BorderRadius.circular(15), // Bordas arredondadas no mapa
            child: SizedBox(
              width: 120, // Defina a largura do mapa
              height: 120, // Defina a altura do mapa
              child: HtmlElementView(
                viewType: 'map',
                onPlatformViewCreated: (int id) {
                  // Configura o estilo diretamente para evitar o erro de altura/largura
                  var mapElement = document.getElementById('map');
                  if (mapElement != null) {
                    mapElement.style.height = '120px';
                    mapElement.style.width = '120px';
                  }
                },
              ),
            ),
          ),
          const SizedBox(width: 16), // Espaço entre o mapa e o conteúdo

          // Informações do ponto de coleta
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '150m | 3 min.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const Text(
                  'PUC Minas - Entrada 4',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '30% de espaço restante',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // Materiais aceitos
                Row(
                  children: const [
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
