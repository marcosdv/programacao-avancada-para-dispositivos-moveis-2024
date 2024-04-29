import 'package:aula06_api/config.dart';
import 'package:aula06_api/extensions/string_extension.dart';

class Pokemon {
  String nome;
  String url;

  Pokemon({required this.nome, required this.url});

  int id() {
    var codigo = url.replaceAll(linkServer, '').replaceAll('/', '');
    return codigo.toInt();
  }

  String imagem() {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/'
        'sprites/pokemon/other/home/${id()}.png';
  }
}