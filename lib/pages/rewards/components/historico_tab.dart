import 'package:flutter/material.dart';
import './historico_summary_card.dart'; // Importa o componente HistoricoSummaryCard
import './pizza_chart_card.dart'; // Importe o componente PizzaChartCard

class HistoricoTab extends StatelessWidget {
  const HistoricoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0), // Adiciona margem lateral
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    HistoricoSummaryCard(), // Usa o card do Histórico
                    SizedBox(height: 20), // Espaçamento entre os componentes
                    PizzaChartCard(), // Usa o card com o gráfico de pizza
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
