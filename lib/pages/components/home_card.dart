import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Adiciona uma sombra ao card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Bordas arredondadas
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.home, size: 40),
              title: Text('Bem-vindo ao App'),
              subtitle: Text('Explore as funcionalidades do nosso aplicativo.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('SAIBA MAIS'),
                  onPressed: () {
                    // Ação quando o botão é clicado
                    print('Botão Saiba Mais clicado');
                  },
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('COMEÇAR'),
                  onPressed: () {
                    // Ação quando o botão é clicado
                    print('Botão Começar clicado');
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
