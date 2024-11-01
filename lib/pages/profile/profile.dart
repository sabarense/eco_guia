import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        automaticallyImplyLeading: false, // Remove o ícone de voltar
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              // Redireciona para a tela de login
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_picture.png'),
            ),
            const SizedBox(height: 20),
            Text(
              'Nome do Usuário',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'email@exemplo.com',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            // Botão Editar Perfil
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/edit_profile');
              },
              child: const Text('Editar Perfil'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF259E73), // Cor personalizada
              ),
            ),
            const SizedBox(height: 10),
            // Adicionando mais informações se necessário
            Text(
              'Sobre você:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Aqui você pode adicionar uma breve descrição sobre você ou interesses.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
