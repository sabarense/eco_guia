import 'package:flutter/material.dart';
import './components/custom_home_card.dart'; // Importe o CustomHomeCard

class Rewards extends StatelessWidget {
  const Rewards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Card Screen'),
      ),
      body: Center(
        child:
            CustomHomeCard(), // Substitui o HomeCard original pelo CustomHomeCard
      ),
    );
  }
}
