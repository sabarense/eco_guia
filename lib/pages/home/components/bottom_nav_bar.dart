import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List<Widget>.generate(4, (index) {
          return IconButton(
            icon: Icon(
              index == 0
                  ? Icons.home_outlined
                  : index == 1
                      ? Icons.location_on_outlined
                      : index == 2
                          ? Icons.lightbulb_outline
                          : Icons.person_outline,
              color: selectedIndex == index
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
            ),
            onPressed: () => onItemTapped(index), // Chama a função ao clicar
          );
        }),
      ),
    );
  }
}
