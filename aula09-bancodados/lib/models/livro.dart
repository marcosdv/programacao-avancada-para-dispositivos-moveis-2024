import 'package:aula09_db/models/editora.dart';

class Livro {
  int? codigo;
  String nome;
  double preco;
  Editora editora;

  Livro({this.codigo, required this.nome,
    required this.preco, required this.editora});
}