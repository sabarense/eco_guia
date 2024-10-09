import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Avatar e informações do usuário
          const Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                    'assets/profile.png'), // Altere o caminho da imagem
              ),
              SizedBox(width: 12), // Espaçamento entre o avatar e o texto
              // Texto com nome e localização
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Olá, Fernando',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                      height: 4), // Espaçamento entre o nome e a localização
                  Text(
                    'Belo Horizonte - MG',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Botão de notificação
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // Ação ao clicar no ícone de notificação
              print('Notificações clicadas');
            },
          ),
        ],
      ),
    );
  }
}
