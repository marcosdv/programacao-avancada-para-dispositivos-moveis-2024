import 'package:aula09_db/datasources/local/banco_dados.dart';
import 'package:aula09_db/datasources/local/editora_helper.dart';
import 'package:aula09_db/models/editora.dart';
import 'package:aula09_db/models/livro.dart';
import 'package:sqflite/sqflite.dart';

class LivroHelper {
  static const createSql = '''
    CREATE TABLE IF NOT EXISTS TbLivro (
      codigo INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      preco REAL,
      editora INTEGER,
      FOREIGN KEY (editora) REFERENCES TbEditora(codigo)
    )
  ''';

  Future<Livro> inserir(Livro livro) async {
    Database db = await BancoDados().db;

    livro.codigo = await db.insert('TbLivro', livro.toMap());

    db.close();
    return livro;
  }

  Future<int> alterar(Livro livro) async {
    Database db = await BancoDados().db;

    int retorno = await db.update(
      'TbLivro',
      livro.toMap(),
      where: 'codigo = ?',
      whereArgs: [livro.codigo]
    );

    db.close();
    return retorno;
  }

  Future<int> excluir(int codigo) async {
    Database db = await BancoDados().db;

    int retorno = await db.delete('TbLivro',
      where: 'codigo = ?', whereArgs: [codigo]);

    db.close();
    return retorno;
  }

  Future<List<Livro>> getByEditora(int codigo) async {
    Editora? editora = await EditoraHelper().getByCodigo(codigo);

    if (editora != null) {
      Database db = await BancoDados().db;

      List dados = await db.query('TbLivro',
        where: 'editora = ?', whereArgs: [codigo],
        orderBy: 'nome'
      );

      return dados.map((e) => Livro.fromMap(e, editora)).toList();
    }

    return [];
  }
}