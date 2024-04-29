import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sobre o App'),
          backgroundColor: Colors.blueAccent.shade700
        ),
        body: Column(
          children: [
            Icon(Ionicons.car_sport, size: 180,
              color: Colors.blue.shade700,),
            const Text('Gasolina x Etanol'),
          ],
        ),
      ),
    );
  }
}