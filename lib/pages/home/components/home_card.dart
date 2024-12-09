import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:eco_guia/services/auth_service.dart';
import 'package:eco_guia/models/user.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    User? currentUser = AuthService.getCurrentUser();

    if (currentUser == null || currentUser.id == null) {
      return const Center(
        child: Text(
          'Erro: Usuário não logado',
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    String uid = currentUser.id!;

    return StreamBuilder<DocumentSnapshot>(
      stream:
          FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Center(
            child: Text(
              'Dados do usuário não encontrados',
              style: TextStyle(color: Colors.red),
            ),
          );
        }

        var userDoc = snapshot.data!;
        var stats = userDoc['stats'] as List<dynamic>? ?? [0, 0, 0];

        int points = stats[0] ?? 0;
        int co2Saved = stats[1] ?? 0;
        int recycled = stats[2] ?? 0;

        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/rewards');
          },
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Image(
                        image: AssetImage('assets/trofeu.png'),
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        points.toString(),
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const Text(
                        'PONTOS',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Image(
                        image: AssetImage('assets/nuvem.png'),
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${co2Saved}g',
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const Text(
                        'CO2 SALVO',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Image(
                        image: AssetImage('assets/bags.png'),
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        recycled.toString(),
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const Text(
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
      },
    );
  }
}
