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
            Text(
              'Itens Reciclados',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface, // Usando a cor do tema
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Os cards ocupam toda a largura disponível e são alinhados
                Expanded(
                  child: _buildMetricCard('493g', 'esse mês',
                      Theme.of(context).colorScheme.primaryContainer),
                ),
                const SizedBox(width: 16), // Espaçamento entre os dois cards
                Expanded(
                  child: _buildMetricCard('62%', 'a mais que a semana passada',
                      Theme.of(context).colorScheme.primaryContainer),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Resumo da semana',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface, // Usando a cor do tema
              ),
            ),
            const SizedBox(height: 16),
            // Gráfico de barras para os dias da semana
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  barGroups: _buildBarGroups(context), // Dados do gráfico
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
    return SizedBox(
      height: 100, // Define uma altura fixa para o card
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: backgroundColor, // Cor de fundo da caixa usando o tema
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alinha o texto à esquerda
          mainAxisAlignment:
              MainAxisAlignment.start, // Garante que o conteúdo fique no topo
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
              style: TextStyle(
                fontSize: 14,
                color: Colors
                    .black54, // Ou use Theme.of(context).colorScheme.onPrimaryContainer
              ),
            ),
          ],
        ),
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
  List<BarChartGroupData> _buildBarGroups(BuildContext context) {
    return [
      _buildBarGroup(context, 0, 5),
      _buildBarGroup(context, 1, 7),
      _buildBarGroup(context, 2, 3),
      _buildBarGroup(context, 3, 4),
      _buildBarGroup(context, 4, 6),
      _buildBarGroup(context, 5, 8),
      _buildBarGroup(context, 6, 2),
    ];
  }

  // Função que constrói cada grupo de barras
  BarChartGroupData _buildBarGroup(BuildContext context, int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 16,
          borderRadius: BorderRadius.circular(4),
          rodStackItems: [
            BarChartRodStackItem(
                0, y, Theme.of(context).colorScheme.primary), // Cor da barra
          ],
        ),
      ],
    );
  }
}
