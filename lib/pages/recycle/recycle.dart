import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_guia/services/auth_service.dart';
import 'recycle_card.dart'; // Certifique-se de usar o caminho correto para o RecycleCard

class Recycle extends StatelessWidget {
  final String nome;
  final String imagePath;

  const Recycle({
    super.key,
    required this.nome,
    required this.imagePath,
  });

  Future<void> _updateUserStatsAndLogRecycle(
      int points, int co2Saved, String nome, String imagePath) async {
    // Obter o usuário atual
    var currentUser = AuthService.getCurrentUser();

    if (currentUser == null || currentUser.id == null) {
      throw Exception('Erro: Usuário não logado');
    }

    String uid = currentUser.id!;

    // Referência ao documento do usuário no Firestore
    var userDocRef = FirebaseFirestore.instance.collection('users').doc(uid);

    // Atualizar o campo stats no Firestore
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      var snapshot = await transaction.get(userDocRef);

      if (!snapshot.exists) {
        throw Exception('Documento do usuário não encontrado.');
      }

      // Recuperar o array stats atual
      List<dynamic> stats = snapshot['stats'] ?? [0, 0, 0];

      // Somar os valores
      stats[0] = (stats[0] ?? 0) + points;
      stats[1] = (stats[1] ?? 0) + co2Saved;
      stats[2] = (stats[2] ?? 0) + 1;

      // Atualizar o documento
      transaction.update(userDocRef, {'stats': stats});
    });

    // Registrar o produto reciclado na coleção 'reciclados'
    final recycledItem = {
      'nome': nome,
      'imagePath':
          imagePath.contains("firebase") ? 'assets/ecoguia.png' : imagePath,
      'points': points,
      'co2Saved': co2Saved,
      'timestamp': FieldValue.serverTimestamp(),
      'user': uid,
    };

    await FirebaseFirestore.instance.collection('reciclados').add(recycledItem);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Gerar co2Saved como um número inteiro aleatório entre 126 e 456
    final co2Saved = (126 + Random().nextDouble() * (456 - 126)).toInt();

    // Calcular points como 1.5 vezes co2Saved (também como inteiro)
    final points = (1.5 * co2Saved).toInt();

    // Verificar se a imagem vem do Firebase ou dos assets
    final isFirebaseImage = imagePath.contains("firebase");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recicle'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Imagem quadrada
          Container(
            width: screenWidth,
            height: screenWidth,
            child: isFirebaseImage
                ? Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback para imagem local caso ocorra um erro
                      return Image.asset(
                        'assets/ecoguia.png',
                        fit: BoxFit.cover,
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child:
                            CircularProgressIndicator(), // Indicador de progresso
                      );
                    },
                  )
                : Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(height: 16),
          // Texto "Estatísticas do $nome"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Estatísticas do $nome',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Exibir valores no card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: RecycleCard(
              points: points,
              co2Saved: co2Saved, // Agora co2Saved é um inteiro
              recycled: 1, // Incremento fixo para cada item reciclado
            ),
          ),
          const Spacer(),
          // Botão "Reciclar Item"
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                try {
                  await _updateUserStatsAndLogRecycle(
                      points, co2Saved, nome, imagePath);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Item reciclado com sucesso!'),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Erro ao reciclar: $e'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'RECICLAR ITEM',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
