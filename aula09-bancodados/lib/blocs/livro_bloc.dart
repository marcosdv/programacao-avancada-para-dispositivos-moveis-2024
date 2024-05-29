import 'package:aula09_db/datasources/local/livro_helper.dart';
import 'package:aula09_db/extensions/string_extension.dart';
import 'package:aula09_db/models/editora.dart';
import 'package:aula09_db/models/livro.dart';
import 'package:aula09_db/ui/widgets/botao_texto.dart';
import 'package:aula09_db/ui/widgets/mensagem_alerta.dart';
import 'package:aula09_db/ui/widgets/mensagem_popup.dart';
import 'package:flutter/material.dart';

class LivroBloc {
  final BuildContext context;
  final Editora editora;
  final Livro? livro;

  final nomeController = TextEditingController();
  final precoController = TextEditingController();
  final _livroHelper = LivroHelper();

  LivroBloc({required this.context, required this.editora, this.livro}) {
    if (livro != null) {
      nomeController.text = livro!.nome;
      precoController.text = livro!.preco.toString();
    }
  }

  Future<List<Livro>> getByEditora(int codigoEditora) {
    return _livroHelper.getByEditora(codigoEditora);
  }
  
  void salvar() async {
    if (nomeController.text.isEmpty) {
      MensagemAlerta().show(
        context: context,
        titulo: 'Atenção',
        texto: 'O nome do livro é obrigatório!'
      );
      return;
    }
    if (precoController.text.toDouble(vlrPadrao: -1) < 0) {
      MensagemAlerta().show(
          context: context,
          titulo: 'Atenção',
          texto: 'O valor do livro é obrigatório!'
      );
      return;
    }

    if (livro == null) {
      await _livroHelper.inserir(Livro(
        nome: nomeController.text,
        preco: precoController.text.toDouble(),
        editora: editora
      ));
    }
    else {
      livro!.nome = nomeController.text;
      livro!.preco = precoController.text.toDouble();
      
      await _livroHelper.alterar(livro!);
    }

    Navigator.pop(context);
  }

  void excluir() {
    MensagemPopup().show(
      context: context,
        titulo: 'Atenção',
        texto: 'Deseja realmente excluir esse Livro?',
      botoes: [
        BotaoTexto(texto: 'Sim', clique: _confirmarExcluir, cor: Colors.red),
        BotaoTexto(texto: 'Não', clique: () { Navigator.pop(context); }),
      ]
    );
  }

  void _confirmarExcluir() async {
    if (livro != null) {
      await _livroHelper.excluir(livro!.codigo ?? 0);
    }
    Navigator.pop(context);
    Navigator.pop(context);
  }
}