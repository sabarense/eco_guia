import 'package:flutter/material.dart';

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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MaterialCard(
                  imagePath: 'assets/plastico.png',
                  materialName: 'Plástico',
                  isSelected: true,
                ),
              ),
              SizedBox(width: 16), // Espaçamento entre os cards
              Expanded(
                child: MaterialCard(
                  imagePath: 'assets/vidro.png',
                  materialName: 'Vidro',
                ),
              ),
              SizedBox(width: 16), // Espaçamento entre os cards
              Expanded(
                child: MaterialCard(
                  imagePath: 'assets/papel.png',
                  materialName: 'Papel',
                ),
              ),
              SizedBox(width: 16), // Espaçamento entre os cards
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
  final bool isSelected;

  const MaterialCard({
    required this.imagePath,
    required this.materialName,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130, // Altura definida para os cards de materiais
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: isSelected
            ? Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2) // Borda verde se selecionado
            : null,
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
            style: TextStyle(
              fontSize: 12,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
