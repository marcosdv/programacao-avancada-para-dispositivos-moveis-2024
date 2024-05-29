import 'package:aula09_db/blocs/livro_bloc.dart';
import 'package:aula09_db/models/editora.dart';
import 'package:aula09_db/models/livro.dart';
import 'package:aula09_db/ui/widgets/barra_titulo.dart';
import 'package:aula09_db/ui/widgets/botao_quadrado.dart';
import 'package:aula09_db/ui/widgets/campo_texto.dart';
import 'package:flutter/material.dart';

class CadLivroPage extends StatefulWidget {
  final Editora editora;
  final Livro? livro;

  const CadLivroPage({required this.editora, this.livro, super.key});

  @override
  State<CadLivroPage> createState() => _CadLivroPageState();
}

class _CadLivroPageState extends State<CadLivroPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = LivroBloc(context: context,
        editora: widget.editora, livro: widget.livro);

    return Placeholder(
      child: Scaffold(
        appBar: BarraTitulo().show('Cadastro de Livro'),
        body: Column(
          children: [
            CampoTexto(
              controller: bloc.nomeController,
              texto: 'Nome'
            ),
            CampoTexto(
              controller: bloc.precoController,
              texto: 'Preço',
              teclado: TextInputType.number,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BotaoQuadrado(
                  clique: bloc.salvar,
                  texto: 'Salvar',
                  cor: Colors.green[700],
                ),
                BotaoQuadrado(
                  clique: () { Navigator.pop(context); },
                  texto: 'Cancelar',
                  cor: Colors.grey,
                ),
                widget.livro == null ? Container()
                    : BotaoQuadrado(
                  clique: bloc.excluir,
                  texto: 'Excluir',
                  cor: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
