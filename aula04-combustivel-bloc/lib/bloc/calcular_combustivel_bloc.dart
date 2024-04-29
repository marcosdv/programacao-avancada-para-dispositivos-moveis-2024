import 'package:aula03/ui/widgets/mensagem_alerta.dart';
import 'package:flutter/widgets.dart';

class CalcularCombustivelBloc {
  final BuildContext context;
  var resultado = '';
  final gasolinaController = TextEditingController();
  final etanolController = TextEditingController();

  CalcularCombustivelBloc(this.context);

  void calcular() {
    final valorGasolina = double.parse(gasolinaController.text);
    final valorEtanol = double.parse(etanolController.text);
    final mensagem = MensagemAlerta();

    if (valorEtanol <= (valorGasolina * 0.7)) {
      resultado = 'Etanol é melhor';
      mensagem.show(context: context, titulo: 'Resultado',
          texto: 'Etanol é melhor');
    }
    else {
      resultado = 'Gasolina é melhor';
      mensagem.show(context: context, titulo: 'Resultado',
          texto: 'Gasolina é melhor');
    }
  }
}