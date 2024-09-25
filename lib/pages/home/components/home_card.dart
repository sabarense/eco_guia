import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context, '/rewards'); // Redireciona para a rota /rewards
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Theme.of(context).colorScheme.primary,
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Icons.emoji_events, size: 40, color: Colors.amber),
                  SizedBox(height: 8),
                  Text(
                    '3229',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    'PONTOS',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.cloud, size: 40, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    '500g',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    'CO2 SALVO',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.shopping_bag, size: 40, color: Colors.pink),
                  SizedBox(height: 8),
                  Text(
                    '23',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    'RECICLADOS',
                    style: TextStyle(color: Colors.white),
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
