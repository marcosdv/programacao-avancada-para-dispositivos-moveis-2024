import 'package:aula09_db/ui/widgets/botao_quadrado.dart';
import 'package:aula09_db/ui/widgets/botao_texto.dart';
import 'package:aula09_db/ui/widgets/mensagem_popup.dart';
import 'package:flutter/material.dart';

class MensagemAlerta {
  Future show({required BuildContext context,
    required String titulo, required String texto}) {
    return MensagemPopup().show(
      context: context,
      titulo: titulo,
      texto: texto,
      botoes: [
        BotaoTexto(
          texto: 'OK',
          clique: () { Navigator.pop(context); }
        ),
      ]
    );
  }
}