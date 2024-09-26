import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HistoricoSummaryCard extends StatelessWidget {
  const HistoricoSummaryCard({super.key});

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
              'Itens Reciclados',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Primeira caixa com "493g esse mês"
                _buildMetricCard('493g', 'esse mês', Colors.green[100]!),
                // Segunda caixa com "62% a mais que a semana passada"
                _buildMetricCard(
                    '62%', 'a mais que a semana passada', Colors.green[100]!),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Resumo da semana',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            // Gráfico de barras para os dias da semana
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  barGroups: _buildBarGroups(), // Dados do gráfico
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: _getTitles, // Nomes dos dias da semana
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Função para construir as caixas com os valores e textos
  Widget _buildMetricCard(String value, String label, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  // Função para os títulos (dias da semana) no eixo X
  Widget _getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black54,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Seg';
        break;
      case 1:
        text = 'Ter';
        break;
      case 2:
        text = 'Qua';
        break;
      case 3:
        text = 'Qui';
        break;
      case 4:
        text = 'Sex';
        break;
      case 5:
        text = 'Sáb';
        break;
      case 6:
        text = 'Dom';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  // Função para criar os dados do gráfico de barras
  List<BarChartGroupData> _buildBarGroups() {
    return [
      _buildBarGroup(0, 5),
      _buildBarGroup(1, 7),
      _buildBarGroup(2, 3),
      _buildBarGroup(3, 4),
      _buildBarGroup(4, 6),
      _buildBarGroup(5, 8),
      _buildBarGroup(6, 2),
    ];
  }

  // Função que constrói cada grupo de barras
  BarChartGroupData _buildBarGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 16,
          borderRadius: BorderRadius.circular(4),
          rodStackItems: [
            BarChartRodStackItem(0, y, Colors.blue),
          ],
        ),
      ],
    );
  }
}
