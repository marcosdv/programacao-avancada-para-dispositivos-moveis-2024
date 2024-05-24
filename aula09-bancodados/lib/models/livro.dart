import 'package:aula09_db/extensions/string_extension.dart';
import 'package:aula09_db/models/editora.dart';

class Livro {
  int? codigo;
  String nome;
  double preco;
  Editora editora;

  Livro({this.codigo, required this.nome,
    required this.preco, required this.editora});

  factory Livro.fromMap(Map mapa, Editora editora) {
    return Livro(
      codigo: mapa["codigo"].toString().toInt(),
      nome: mapa["nome"],
      preco: mapa["preco"].toString().toDouble(),
      editora: editora
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "codigo": codigo,
      "nome": nome,
      "preco": preco,
      "editora": editora.codigo
    };
  }
}