import 'package:aula09_db/datasources/local/livro_helper.dart';
import 'package:aula09_db/models/livro.dart';

class LivroBloc {
  final _livroHelper = LivroHelper();

  Future<List<Livro>> getByEditora(int codigoEditora) {
    return _livroHelper.getByEditora(codigoEditora);
  }
}