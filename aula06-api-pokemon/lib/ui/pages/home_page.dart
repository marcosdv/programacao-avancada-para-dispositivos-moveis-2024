import 'package:aula06_api/datasources/remote/pokemon_remote.dart';
import 'package:aula06_api/models/pokemon.dart';
import 'package:aula06_api/ui/pages/detalhes_page.dart';
import 'package:aula06_api/ui/widgets/circulo_espera.dart';
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
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          title: Text('Pokedex', style: TextStyle(color: Colors.amber.shade500)),
          backgroundColor: Colors.blue.shade900,
        ),
        body: FutureBuilder(
          future: PokemonRemote().get(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CirculoEspera();
              default:
                return _criarLista(context, snapshot.data ?? []);
            }
          },
        ),
      ),
    );
  }

  Widget _criarLista(BuildContext context, List<Pokemon> lista) {
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: GestureDetector(
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Image.network(
                      lista[index].imagem(),
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    Expanded(
                      child: Text(lista[index].nome, style: const TextStyle(fontSize: 22),),
                    ),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => DetalhesPage(lista[index]))
              );
            },
          ),
        );
      }
    );
  }
}