import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Aula 02'),
          backgroundColor: Colors.blue
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(14),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Campo Texto',
                  prefixText: 'R\$',
                  border: OutlineInputBorder()
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () { },
              child: Text('Clique Aqui'),
            ),
          ],
        ),
      ),
    );
  }
}
