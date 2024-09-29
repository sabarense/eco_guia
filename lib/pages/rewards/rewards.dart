import 'package:flutter/material.dart';
import './components/custom_home_card.dart'; // Importe o CustomHomeCard
import './components/tabs.dart'; // Importe o HistoricoRewardsTabs

class Rewards extends StatelessWidget {
  const Rewards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Centraliza o título
        title: const Text(
          'Estatísticas',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Negrito no título
            color: Colors
                .black, // Define a cor do título como preto para contraste
          ),
        ),
        elevation: 4, // Sombra suave na base da AppBar
        shadowColor: Colors.black.withOpacity(0.2), // Cor da sombra
        backgroundColor: Colors.white, // Define o fundo da AppBar como branco
        iconTheme: const IconThemeData(
          color: Colors.black, // Define a cor dos ícones como preta
        ),
      ),
      body: SingleChildScrollView(
        // Permite que toda a tela seja rolável
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // Alinha widgets ao longo do eixo horizontal
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top:
                      20.0), // Adiciona espaçamento entre a AppBar e o primeiro widget
              child: CustomHomeCard(), // Mantém o CustomHomeCard
            ),
            const SizedBox(height: 60), // Adiciona espaçamento entre os widgets
            SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.6, // Defina uma altura fixa ou use Expanded
              child:
                  const HistoricoRewardsTabs(), // Adiciona o HistoricoRewardsTabs abaixo
            ),
          ],
        ),
      ),
    );
  }
}
