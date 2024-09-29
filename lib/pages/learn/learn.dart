import 'package:flutter/material.dart';
import 'components/descubra_widget.dart'; // Mantendo o import do DescubraWidget
import 'components/topicos_card.dart'; // Importe o TopicosCard

class Tela2 extends StatelessWidget {
  const Tela2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Centraliza o título
        title: const Text(
          'Learn',
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
        child: Column(
          children: <Widget>[
            const DescubraWidget(), // Mantendo o DescubraWidget
            const SizedBox(height: 20),
            // Novo Componente TópicosCard
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0), // Margem lateral
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tópicos para você',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Aplicar Padding no TopicosCard para manter a margem
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0), // Mesma margem lateral
              child: TopicosCard(
                title: 'Do lixo a arte',
                description:
                    'Artistas usam materiais reciclados ou reutilizados para criar obras chamativas de arte contemporânea.',
                imageUrl: 'assets/cardlearn2.png',
                backgroundColor: Color(0xFF259E73),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0), // Mesma margem lateral
              child: TopicosCard(
                title: 'Se torne um voluntário',
                description:
                    'Descubra a força que a cooperação tem na missão de resgatar o planeta.',
                imageUrl: 'assets/cardlearn1.png',
                backgroundColor: Color(0xFFF6AA56),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
