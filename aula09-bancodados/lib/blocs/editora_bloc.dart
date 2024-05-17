import 'package:aula09_db/datasources/local/editora_helper.dart';
import 'package:aula09_db/models/editora.dart';
import 'package:aula09_db/ui/widgets/mensagem_alerta.dart';
import 'package:flutter/material.dart';

class EditoraBloc {
  final BuildContext context;
  final _editoraHelper = EditoraHelper();
  final nomeController = TextEditingController();

  EditoraBloc(this.context);

  Future<List<Editora>> getTodos() {
    return _editoraHelper.getTodos();
  }

  void salvar() async {
    if (nomeController.text.trim().isEmpty) {
      MensagemAlerta().show(
        context: context,
        titulo: 'Atenção',
        texto: 'O nome da editora é obrigatório!'
      );
      return;
    }

    await _editoraHelper.inserir(Editora(nome: nomeController.text));

    Navigator.pop(context);
  }
}