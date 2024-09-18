import 'package:flutter/material.dart';

class Tela3 extends StatelessWidget {
  const Tela3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bem-vindo à Tela 1',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Voltar para a tela anterior (Home)
              },
              child: const Text('Voltar para Home'),
            ),
          ],
        ),
      ),
    );
  }
}
