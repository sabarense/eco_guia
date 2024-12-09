import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_guia/services/auth_service.dart';

class HistoricoSummaryCard extends StatelessWidget {
  const HistoricoSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Obter usuário logado
    var currentUser = AuthService.getCurrentUser();

    if (currentUser == null || currentUser.id == null) {
      return const Center(
        child: Text(
          'Erro: Usuário não logado',
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    String uid = currentUser.id!;

    return StreamBuilder<DocumentSnapshot>(
      stream:
          FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Center(
            child: Text(
              'Dados do usuário não encontrados',
              style: TextStyle(color: Colors.red),
            ),
          );
        }

        // Recuperar o campo "stats"
        var userDoc = snapshot.data!;
        var stats = userDoc['stats'] as List<dynamic>? ?? [0, 0, 0];

        // Obter o valor do CO2 salvo (posição 1 do array)
        String co2Saved = '${stats[1] ?? 0}g';

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
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Substituir o valor fixo '493g' pelo valor buscado do Firestore
                    Expanded(
                      child: _buildMetricCard(
                        co2Saved,
                        'de CO2 salvo esse mês',
                        Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ),
                    const SizedBox(
                        width: 16), // Espaçamento entre os dois cards
                    Expanded(
                      child: _buildMetricCard(
                        '100%',
                        'a mais que a semana passada',
                        Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Resumo da semana',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
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
                            getTitlesWidget:
                                _getTitles, // Nomes dos dias da semana
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
      },
    );
  }

  // Função para construir as caixas com os valores e textos
  Widget _buildMetricCard(String value, String label, Color backgroundColor) {
    return SizedBox(
      height: 100,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

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

  List<BarChartGroupData> _buildBarGroups(BuildContext context) {
    return [
      _buildBarGroup(context, 0, 5),
      _buildBarGroup(context, 1, 0),
      _buildBarGroup(context, 2, 0),
      _buildBarGroup(context, 3, 0),
      _buildBarGroup(context, 4, 0),
      _buildBarGroup(context, 5, 0),
      _buildBarGroup(context, 6, 0),
    ];
  }

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
              0,
              y,
              Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ],
    );
  }
}
