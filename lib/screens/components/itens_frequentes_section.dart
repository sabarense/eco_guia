// ignore_for_file: prefer_const_constructors, unnecessary_const, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ItensFrequentesSection extends StatelessWidget {
  const ItensFrequentesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título da seção
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: const Text(
            'Itens Frequentes',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16), // Espaçamento entre o título e os itens
        // Lista de itens
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: const [
              FrequentItem(
                imagePath: 'assets/coffee_cup.png', // Imagem do copo de café
                backgroundColor: const Color(0xFFFFDAB0),
              ),

              SizedBox(width: 16), // Espaçamento entre os itens
              FrequentItem(
                imagePath: 'assets/can.png', // Imagem de uma lata
                backgroundColor: const Color(0xFFD6F4EA),
              ),
              SizedBox(width: 16),
              FrequentItem(
                imagePath: 'assets/banana.png', // Imagem de uma banana
                backgroundColor: const Color(0xFFD6F4EA),
              ),
              SizedBox(width: 16),
              FrequentItem(
                imagePath:
                    'assets/plastic-bag.png', // Imagem de uma sacola plástica
                backgroundColor: const Color(0xFFFFDAB0),
              ),
              SizedBox(width: 16),
              FrequentItem(
                imagePath: 'assets/phone.png', // Imagem de um telefone
                backgroundColor: const Color(0xFFD6F4EA),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Componente para cada item frequente
class FrequentItem extends StatelessWidget {
  final String imagePath;
  final Color backgroundColor;

  const FrequentItem({
    required this.imagePath,
    required this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40, // Tamanho do círculo
      backgroundColor: backgroundColor,
      child: Padding(
        padding:
            const EdgeInsets.all(12.0), // Espaçamento interno para as imagens
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain, // Para que a imagem se ajuste ao círculo
        ),
      ),
    );
  }
}
