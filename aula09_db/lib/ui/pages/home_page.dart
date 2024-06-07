import 'package:aula09_db/blocs/editora_bloc.dart';
import 'package:aula09_db/models/editora.dart';
import 'package:aula09_db/ui/pages/cad_editora_page.dart';
import 'package:aula09_db/ui/pages/livros_page.dart';
import 'package:aula09_db/ui/widgets/barra_titulo.dart';
import 'package:aula09_db/ui/widgets/botao_texto.dart';
import 'package:aula09_db/ui/widgets/circulo_espera.dart';
import 'package:aula09_db/ui/widgets/item_lista.dart';
import 'package:aula09_db/ui/widgets/mensagem_erro.dart';
import 'package:aula09_db/ui/widgets/mensagem_popup.dart';
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
                  return _criarLista(snapshot.data!, _editoraBloc);
                }
            }
          },
        ),
      ),
    );
  }

  Widget _criarLista(List<Editora> lista, EditoraBloc bloc) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.vertical,
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.horizontal,
          background: Container(
            alignment: Alignment.centerLeft,
            color: Colors.lightBlueAccent,
            child: const Text('Editar', style: TextStyle(fontSize: 22)),
          ),
          secondaryBackground: Container(
            alignment: Alignment.centerRight,
            color: Colors.red,
            child: const Text('Excluir', style: TextStyle(fontSize: 22)),
          ),
          child: _criarItem(lista[index]),
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.startToEnd) {
              _abrirCadastro(editora: lista[index]);
            }
            else if (direction == DismissDirection.endToStart) {
              bloc.excluirLista(lista[index].codigo ?? 0);
            }
          },
          confirmDismiss: (DismissDirection direction) async {
            if (direction == DismissDirection.endToStart) {
              return await MensagemPopup().show(
                context: context,
                titulo: 'Atenção',
                texto: 'Deseja realmente excluir esta editora?',
                botoes: [
                  BotaoTexto(texto: 'Sim', cor: Colors.red, clique: () {
                    Navigator.of(context).pop(true);
                  }),
                  BotaoTexto(texto: 'Não', clique: () {
                    Navigator.of(context).pop(false);
                  }),
                ]
              );
            }

            return true;
          },
        );
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