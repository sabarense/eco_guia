import 'package:flutter/material.dart';

class HistoricoRewardsTabs extends StatefulWidget {
  const HistoricoRewardsTabs({super.key});

  @override
  _HistoricoRewardsTabsState createState() => _HistoricoRewardsTabsState();
}

class _HistoricoRewardsTabsState extends State<HistoricoRewardsTabs> {
  int _selectedIndex = 0;

  final List<Widget> _tabContents = [
    Center(child: Text('Conteúdo do Histórico')),
    Center(child: Text('Conteúdo do Rewards')),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Abas
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => _onTabTapped(0),
              child: Column(
                children: [
                  Text(
                    'HISTÓRICO',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _selectedIndex == 0
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Barra verde ou cinza sob a aba
                  Container(
                    height: 2,
                    width: 50,
                    color: _selectedIndex == 0
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _onTabTapped(1),
              child: Column(
                children: [
                  Text(
                    'REWARDS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _selectedIndex == 1
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Barra verde ou cinza sob a aba
                  Container(
                    height: 2,
                    width: 50,
                    color: _selectedIndex == 1
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Conteúdo das Abas
        // Substituí o Expanded por Flexible para evitar problemas de layout
        Flexible(
          child: _tabContents[
              _selectedIndex], // Exibe o conteúdo com base na aba selecionada
        ),
      ],
    );
  }
}
