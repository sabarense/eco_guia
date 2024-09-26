import 'package:flutter/material.dart';
import './components/custom_home_card.dart'; // Importe o CustomHomeCard
import './components/historico_rewards_tabs.dart'; // Importe o HistoricoRewardsTabs

class Rewards extends StatelessWidget {
  const Rewards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Card Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment
            .stretch, // Alinha widgets ao longo do eixo horizontal
        children: [
          CustomHomeCard(), // Mantém o CustomHomeCard
          const SizedBox(height: 60), // Adiciona espaçamento entre os widgets
          Expanded(
            // Usa Expanded para ocupar o espaço restante
            child:
                const HistoricoRewardsTabs(), // Adiciona o HistoricoRewardsTabs abaixo
          ),
        ],
      ),
    );
  }
}
