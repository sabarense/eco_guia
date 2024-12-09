import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_guia/services/auth_service.dart';
import 'package:eco_guia/models/user.dart';

class CustomHomeCard extends StatelessWidget {
  const CustomHomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Calcula a largura da tela
    final screenWidth = MediaQuery.of(context).size.width;

    // Obter usuário logado
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

        return SingleChildScrollView(
          // Permite a rolagem do conteúdo
          child: SizedBox(
            height:
                250, // Define uma altura fixa para garantir que o Stack tenha espaço
            child: Stack(
              alignment: Alignment.center, // Centraliza o conteúdo
              clipBehavior: Clip
                  .none, // Permite que os widgets saiam dos limites do Stack
              children: [
                // Card verde (fundo)
                Positioned(
                  top: 0,
                  child: Container(
                    width: screenWidth - 50, // Largura do card verde
                    height: 200, // Altura do card verde
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary, // Cor verde
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                // Ícone de estatísticas no centro superior
                Positioned(
                  top: 40, // Ajustado para subir mais o ícone
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.bar_chart, // Ícone de estatísticas
                      color: Theme.of(context).colorScheme.primary,
                      size: 30,
                    ),
                  ),
                ),
                // Card branco com textos (mais largo e movido para cima)
                Positioned(
                  top: 130, // Subi o card para ficar mais sobreposto ao verde
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      width: screenWidth * 0.7, // Aumentado um pouco o tamanho
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Image(
                                image: AssetImage(
                                    'assets/trofeu.png'), // Imagem do troféu
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                points.toString(),
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const Text(
                                'PONTOS',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Image(
                                image: AssetImage(
                                    'assets/nuvem.png'), // Imagem da nuvem
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${co2Saved}g',
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const Text(
                                'CO2 SALVO',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Image(
                                image: AssetImage(
                                    'assets/bags.png'), // Imagem da sacola
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                recycled.toString(),
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const Text(
                                'RECICLADOS',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
