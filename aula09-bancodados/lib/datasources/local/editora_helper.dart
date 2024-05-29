import 'package:aula09_db/datasources/local/banco_dados.dart';
import 'package:aula09_db/models/editora.dart';
import 'package:sqflite/sqflite.dart';

class EditoraHelper {
  static const createSql = '''
    CREATE TABLE IF NOT EXISTS TbEditora (
      codigo INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT
    )
  ''';

  Future<Editora> inserir(Editora editora) async {
    Database db = await BancoDados().db;

    editora.codigo = await db.insert('TbEditora', editora.toMap());
    db.close();

    return editora;
  }

  Future<int> alterar(Editora editora) async {
    Database db = await BancoDados().db;

    int retorno = await db.update('TbEditora', editora.toMap(),
        where: 'codigo = ?', whereArgs: [editora.codigo]);

    db.close();

    return retorno;
  }

  Future<int> excluir(int codigo) async {
    Database db = await BancoDados().db;

    int retorno = await db.delete('TbEditora',
        where: 'codigo = ?', whereArgs: [codigo]);

    db.close();

    return retorno;
  }

  Future<List<Editora>> getTodos() async {
    Database db = await BancoDados().db;

    List listaDados = await db.query('TbEditora');

    db.close();
    return listaDados.map((e) => Editora.fromMap(e)).toList();
  }

  Future<Editora?> getByCodigo(int codigo) async {
    Database db = await BancoDados().db;

    List listaDados = await db.query('TbEditora',
      where: 'codigo = ?', whereArgs: [codigo]);

    if (listaDados.isNotEmpty) {
      return Editora.fromMap(listaDados.first);
    }

    return null;
  }
}