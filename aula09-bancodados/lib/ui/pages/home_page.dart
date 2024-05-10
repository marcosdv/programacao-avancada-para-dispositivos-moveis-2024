import 'package:aula09_db/blocs/editora_bloc.dart';
import 'package:aula09_db/models/editora.dart';
import 'package:aula09_db/ui/widgets/barra_titulo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _editoraBloc = EditoraBloc();

    return Placeholder(
      child: Scaffold(
        appBar: BarraTitulo().show('Editoras'),
        floatingActionButton: FloatingActionButton(
          onPressed: () { },
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder(
          future: _editoraBloc.getTodos(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              default:
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                else {
                  return _criarLista(snapshot.data!);
                }
            }
          },
        ),
      ),
    );
  }

  Widget _criarLista(List<Editora> lista) {
    return Container();
  }
}