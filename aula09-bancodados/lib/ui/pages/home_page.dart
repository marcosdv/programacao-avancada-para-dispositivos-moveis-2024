import 'package:aula09_db/blocs/editora_bloc.dart';
import 'package:aula09_db/models/editora.dart';
import 'package:aula09_db/ui/pages/cad_editora_page.dart';
import 'package:aula09_db/ui/pages/livros_page.dart';
import 'package:aula09_db/ui/widgets/barra_titulo.dart';
import 'package:aula09_db/ui/widgets/circulo_espera.dart';
import 'package:aula09_db/ui/widgets/item_lista.dart';
import 'package:aula09_db/ui/widgets/mensagem_erro.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _editoraBloc = EditoraBloc(context);

    return Placeholder(
      child: Scaffold(
        appBar: BarraTitulo().show('Editoras'),
        floatingActionButton: FloatingActionButton(
          onPressed: () { _abrirCadastro(); },
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder(
          future: _editoraBloc.getTodos(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CirculoEspera();
              default:
                if (snapshot.hasError) {
                  return MensagemErro(texto: snapshot.error.toString());
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
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.vertical,
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return _criarItem(lista[index]);
      }
    );
  }

  Widget _criarItem(Editora editora) {
    return ItemLista(
      titulo: editora.nome,
      cliqueLongo: () { _abrirCadastro(editora: editora); },
      clique: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => LivrosPage(editora))
        );
      },
    );
  }

  void _abrirCadastro({Editora? editora}) async {
    await Navigator.push(context, MaterialPageRoute(
        builder: (context) => CadEditoraPage(editora: editora)
    ));

    setState(() { });
  }
}