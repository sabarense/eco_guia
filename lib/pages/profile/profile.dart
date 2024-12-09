import 'package:flutter/material.dart';
import 'package:eco_guia/services/auth_service.dart';
import 'package:eco_guia/models/user.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    User? currentUser = AuthService.getCurrentUser();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: () {
              AuthService.logout(context);
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
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            const SizedBox(height: 20),
            Text(
              currentUser?.name ?? 'Nome do Usuário',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              currentUser?.email ?? 'email@exemplo.com',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit_profile');
                  },
                  child: const Text('Editar Perfil'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF259E73),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/delete_profile');
                  },
                  child: const Text('Excluir Perfil'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF900000), // Cor de fundo do botão
                    foregroundColor: Colors.white, // Cor do texto do botão
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Tab para "Ver Itens Reciclados"
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/itens_reciclados');
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Ver itens reciclados',
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
