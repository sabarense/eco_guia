import 'package:flutter/material.dart';
import './historico_summary_card.dart'; // Importa o componente criado

class HistoricoTab extends StatelessWidget {
  const HistoricoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            HistoricoSummaryCard(), // Usa o card do Histórico
          ],
        ),
      ),
    );
  }
}
