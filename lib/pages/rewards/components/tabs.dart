import 'package:flutter/material.dart';
import './historico_tab.dart'; // Importa o componente da aba Histórico
import './rewards_tab.dart'; // Importa o componente da aba Rewards

class HistoricoRewardsTabs extends StatefulWidget {
  const HistoricoRewardsTabs({super.key});

  @override
  HistoricoRewardsTabsState createState() => HistoricoRewardsTabsState();
}

class HistoricoRewardsTabsState extends State<HistoricoRewardsTabs> {
  int _selectedIndex = 0;

  final List<Widget> _tabContents = [
    const HistoricoTab(), // Usa o componente separado para a aba Histórico
    const RewardsTab(), // Usa o componente separado para a aba Rewards
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildTabItem(BuildContext context, String title, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 2,
            width: 70,
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.grey[300],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTabItem(context, 'HISTÓRICO', 0),
            _buildTabItem(context, 'REWARDS', 1),
          ],
        ),
        const SizedBox(height: 20),
        Flexible(
          child:
              _tabContents[_selectedIndex], // Usa o componente correspondente
        ),
      ],
    );
  }
}
