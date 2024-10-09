import 'package:flutter/material.dart';

class CustomHomeCard extends StatelessWidget {
  const CustomHomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Calcula a largura da tela
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      // Permite a rolagem do conteúdo
      child: SizedBox(
        height:
            250, // Define uma altura fixa para garantir que o Stack tenha espaço
        child: Stack(
          alignment: Alignment.center, // Centraliza o conteúdo
          clipBehavior:
              Clip.none, // Permite que os widgets saiam dos limites do Stack
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Image(
                            image: AssetImage(
                                'assets/trofeu.png'), // Imagem do troféu
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(height: 8),
                          Text(
                            '3229',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            'PONTOS',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image(
                            image: AssetImage(
                                'assets/nuvem.png'), // Imagem da nuvem
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(height: 8),
                          Text(
                            '500g',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            'CO2 SALVO',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image(
                            image: AssetImage(
                                'assets/bags.png'), // Imagem da sacola
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(height: 8),
                          Text(
                            '23',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
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
  }
}
