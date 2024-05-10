import 'package:aula09_db/datasources/local/editora_helper.dart';
import 'package:aula09_db/models/editora.dart';

class EditoraBloc {
  final _editoraHelper = EditoraHelper();

  Future<List<Editora>> getTodos() {
    return _editoraHelper.getTodos();
  }
}