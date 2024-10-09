import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PizzaChartCard extends StatelessWidget {
  const PizzaChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Materiais mais reciclados',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            // Usa um Row para posicionar o gráfico e a legenda lado a lado
            Row(
              children: [
                // Gráfico de Pizza
                Expanded(
                  flex: 2, // Proporção do espaço para o gráfico
                  child: AspectRatio(
                    aspectRatio:
                        1, // Mantém o gráfico de pizza em uma proporção adequada
                    child: PieChart(
                      PieChartData(
                        sections: _buildPieChartSections(),
                        centerSpaceRadius: 40,
                        sectionsSpace: 4,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16), // Espaço entre o gráfico e a legenda
                // Legenda
                Expanded(
                  flex: 1, // Proporção do espaço para a legenda
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLegendItem(Color(0xFF185A46), 'Papel'),
                      const SizedBox(height: 8),
                      _buildLegendItem(Color(0xFFFBA746), 'Plástico'),
                      const SizedBox(height: 8),
                      _buildLegendItem(Color(0xFFFB6A46), 'Vidro'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Função que cria os dados para o gráfico de pizza
  List<PieChartSectionData> _buildPieChartSections() {
    return [
      PieChartSectionData(
        color: const Color(0xFF185A46), // Cor #185A46
        value: 50,
        title: '50%',
        radius: 40,
        titleStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: const Color(0xFFFBA746), // Cor #FBA746
        value: 15,
        title: '15%',
        radius: 40,
        titleStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: const Color(0xFFFB6A46), // Cor #FB6A46
        value: 35,
        title: '35%',
        radius: 40,
        titleStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ];
  }

  // Função que constrói o item da legenda
  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
