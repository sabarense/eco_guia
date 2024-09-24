import 'package:flutter/material.dart';
import 'card_personalizado.dart'; // Importe o CardPersonalizado

class DescubraWidget extends StatelessWidget {
  const DescubraWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Descubra',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Lógica para ver todos
                },
                child: const Text('Ver todos'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CardPersonalizado(
                imageUrl: 'assets/card1.png',
                title: 'Quais plásticos podem ser reciclados?',
              ),
              CardPersonalizado(
                imageUrl: 'assets/card2.png',
                title: 'Maneiras para reduzir o desperdício',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
