import 'package:flutter/material.dart';
import '../../recycle/recycle.dart'; // Importação da tela Recycle

class MateriaisSection extends StatelessWidget {
  const MateriaisSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Cabeçalho da seção
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Materiais',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // Ação para ver todos os materiais
                  print('Ver todos os materiais');
                },
                child: const Text('Ver todos'),
              ),
            ],
          ),
        ),
        // Lista de materiais ocupando a largura total da tela
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MaterialCard(
                  imagePath: 'assets/plastico.png',
                  materialName: 'Plástico',
                ),
              ),
              const SizedBox(width: 16), // Espaçamento entre os cards
              Expanded(
                child: MaterialCard(
                  imagePath: 'assets/vidro.png',
                  materialName: 'Vidro',
                ),
              ),
              const SizedBox(width: 16), // Espaçamento entre os cards
              Expanded(
                child: MaterialCard(
                  imagePath: 'assets/papel.png',
                  materialName: 'Papel',
                ),
              ),
              const SizedBox(width: 16), // Espaçamento entre os cards
              Expanded(
                child: MaterialCard(
                  imagePath: 'assets/metal.png',
                  materialName: 'Metal',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MaterialCard extends StatelessWidget {
  final String imagePath;
  final String materialName;

  const MaterialCard({
    required this.imagePath,
    required this.materialName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Ajustar o caminho da imagem para incluir "highres"
        final adjustedImagePath = _getHighResImagePath(imagePath);

        // Navegar para a tela Recycle passando os parâmetros
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Recycle(
              nome: materialName,
              imagePath: adjustedImagePath,
            ),
          ),
        );
      },
      child: Container(
        height: 130, // Altura definida para os cards de materiais
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5), // Sombra sutil
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 80,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(
              materialName,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Ajusta o caminho para incluir "highres" antes da extensão .png
  String _getHighResImagePath(String path) {
    return path.replaceAll('.png', 'highres.png');
  }
}
