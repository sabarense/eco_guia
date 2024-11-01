import 'package:flutter/material.dart';
import 'components/descubra_widget.dart'; // Mantendo o import do DescubraWidget
import 'components/topicos_card.dart'; // Importe o TopicosCard

class Learn extends StatelessWidget {
  const Learn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Learn',
          style: TextStyle(
            fontWeight: FontWeight.normal, // Remover o negrito
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, // Remover a sombra da AppBar
        automaticallyImplyLeading: false, 
        iconTheme: const IconThemeData(
          color: Colors.black, // Cor do ícone de voltar
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const DescubraWidget(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TopicosCard(
                title: 'Do lixo a arte',
                description:
                    'Artistas usam materiais reciclados ou reutilizados para criar obras chamativas de arte contemporânea.',
                imageUrl: 'assets/cardlearn2.png',
                backgroundColor: Color(0xFF259E73),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
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
