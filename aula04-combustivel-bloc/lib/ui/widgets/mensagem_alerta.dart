import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MensagemAlerta {
  Widget botao(BuildContext context, VoidCallback clique, String texto) {
    final tema = Theme.of(context);
    switch (tema.platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoDialogAction(onPressed: clique, child: Text(texto));

      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return TextButton(onPressed: clique, child: Text(texto));
    }
  }

  void show({
    required BuildContext context,
    required String titulo,
    required String texto
  }) {
    showAdaptiveDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog.adaptive(
        title: Text(titulo),
        content: Text(texto),
        actions: [
          botao(context, () { Navigator.pop(context); }, 'Ok')
        ],
      ),
    );
  }
}