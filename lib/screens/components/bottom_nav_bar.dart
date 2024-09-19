import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      // Redirecionamento baseado no índice selecionado
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/');
          break;
        case 1:
          Navigator.pushNamed(context, '/lixeiras');
          break;
        case 2:
          Navigator.pushNamed(context, '/learn');
          break;
        case 3:
          Navigator.pushNamed(context, '/conta');
          break;
        default:
          Navigator.pushNamed(context, '/');
      }
    });
  }

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
              color: _selectedIndex == index ? Colors.green : Colors.grey,
            ),
            onPressed: () => _onItemTapped(index),
          );
        }),
      ),
    );
  }
}
