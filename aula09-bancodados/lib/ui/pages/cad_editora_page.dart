import 'package:aula09_db/blocs/editora_bloc.dart';
import 'package:aula09_db/models/editora.dart';
import 'package:aula09_db/ui/widgets/barra_titulo.dart';
import 'package:aula09_db/ui/widgets/botao_quadrado.dart';
import 'package:aula09_db/ui/widgets/campo_texto.dart';
import 'package:flutter/material.dart';

class CadEditoraPage extends StatefulWidget {
  final Editora? editora;

  const CadEditoraPage({this.editora, super.key});

  @override
  State<CadEditoraPage> createState() => _CadEditoraPageState();
}

class _CadEditoraPageState extends State<CadEditoraPage> {
  @override
  Widget build(BuildContext context) {
    final _editoraBloc = EditoraBloc(context, editora: widget.editora);
    
    return Placeholder(
      child: Scaffold(
        appBar: BarraTitulo().show('Cadastro de Editora'),
        body: Column(
          children: [
            CampoTexto(
              controller: _editoraBloc.nomeController,
              texto: 'Nome',
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BotaoQuadrado(
                  clique: _editoraBloc.salvar,
                  texto: 'Salvar',
                  cor: Colors.green[700],
                ),
                BotaoQuadrado(
                  clique: () { Navigator.pop(context); },
                  texto: 'Cancelar',
                  cor: Colors.grey,
                ),
                widget.editora == null ? Container()
                  : BotaoQuadrado(
                      clique: _editoraBloc.excluir,
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
