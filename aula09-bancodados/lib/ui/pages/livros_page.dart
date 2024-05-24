import 'package:aula09_db/blocs/livro_bloc.dart';
import 'package:aula09_db/models/editora.dart';
import 'package:aula09_db/models/livro.dart';
import 'package:aula09_db/ui/widgets/barra_titulo.dart';
import 'package:aula09_db/ui/widgets/circulo_espera.dart';
import 'package:aula09_db/ui/widgets/mensagem_erro.dart';
import 'package:flutter/material.dart';

class LivrosPage extends StatefulWidget {
  final Editora editora;

  const LivrosPage(this.editora, {super.key});

  @override
  State<LivrosPage> createState() => _LivrosPageState();
}

class _LivrosPageState extends State<LivrosPage> {
  @override
  Widget build(BuildContext context) {
    final _bloc = LivroBloc();

    return Placeholder(
      child: Scaffold(
        appBar: BarraTitulo().show('Livros - ${widget.editora.nome}'),
        floatingActionButton: FloatingActionButton(
          onPressed: _abrirCadastro,
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder(
          future: _bloc.getByEditora(widget.editora.codigo ?? 0),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const CirculoEspera();
              default:
                if (snapshot.hasError) {
                  return MensagemErro(texto: snapshot.error.toString());
                }
                else{
                  return _criarLista(snapshot.data!);
                }
            }
          },
        ),
      ),
    );
  }

  void _abrirCadastro({Livro? livro}) {

  }

  Widget _criarLista(List<Livro> lista) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return Text(lista[index].nome);
      }
    );
  }
}