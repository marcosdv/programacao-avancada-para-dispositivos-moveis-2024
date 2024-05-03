class LivroHelper {
  static const createSql = '''
    CREATE TABLE IF NOT EXISTS TbLivro (
      codigo INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      preco REAL,
      editora INTEGER,
      FOREING KEY (editora) REFERENCES TbEditora(codigo)
    )
  ''';

}