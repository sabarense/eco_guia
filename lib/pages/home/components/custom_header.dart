import 'package:flutter/material.dart';
import 'package:eco_guia/services/auth_service.dart';
import 'package:eco_guia/models/user.dart';

class CustomHeader extends StatefulWidget {
  const CustomHeader({super.key});

  @override
  _CustomHeaderState createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  String _location =
      'Carregando localização...'; // Estado inicial da localização

  @override
  void initState() {
    super.initState();
    _getUserLocation(); // Obtém a localização do usuário ao iniciar
  }

  Future<void> _getUserLocation() async {
    String address = await AuthService
        .obterEndereco(); // Obtém o endereço usando o método do AuthService
    setState(() {
      _location = address; // Atualiza a localização no estado
    });
  }

  @override
  Widget build(BuildContext context) {
    User? currentUser =
        AuthService.getCurrentUser(); // Obtendo o usuário logado

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                    'assets/profile.png'), // Altere o caminho da imagem
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Olá, ${currentUser?.name ?? "Visitante"}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _location, // Exibe a localização do usuário
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              print('Notificações clicadas');
            },
          ),
        ],
      ),
    );
  }
}
