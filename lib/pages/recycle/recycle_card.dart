import 'package:flutter/material.dart';

class RecycleCard extends StatelessWidget {
  final int points;
  final int co2Saved;
  final int recycled;

  const RecycleCard({
    super.key,
    required this.points,
    required this.co2Saved,
    required this.recycled,
  });

  @override
  Widget build(BuildContext context) {
    // Calcula a largura da tela
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: screenWidth * 0.9, // Largura consistente com o botão
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Image(
                    image: AssetImage('assets/trofeu.png'), // Imagem do troféu
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '+$points', // Adiciona o "+" antes do valor
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'PONTOS',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              Column(
                children: [
                  const Image(
                    image: AssetImage('assets/nuvem.png'), // Imagem da nuvem
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '+${co2Saved}g',
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const Text(
                    'CO2 SALVO',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              Column(
                children: [
                  const Image(
                    image: AssetImage('assets/bags.png'), // Imagem da sacola
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '+$recycled', // Adiciona o "+" antes do valor
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'ITEM RECICLADO',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
