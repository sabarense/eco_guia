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
          IconData icon;

          if (index == 0) {
            icon = Icons.home_outlined; // Home
          } else if (index == 1) {
            icon = Icons.location_on_outlined; // Locations
          } else if (index == 2) {
            icon = Icons.lightbulb_outline; // Learn
          } else {
            icon = Icons.person_outline; // Profile
          }

          return IconButton(
            icon: Icon(
              icon,
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
