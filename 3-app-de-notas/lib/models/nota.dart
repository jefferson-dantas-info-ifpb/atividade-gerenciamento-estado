import 'package:appdenotas/models/categoria.dart';
import 'package:uuid/uuid.dart';

class Nota {
  String id;
  String conteudo;
  List<Categoria> categorias = [];
  bool favorita = false;

  Nota({required this.conteudo, List<Categoria>? categorias})
      : id = const Uuid().v4(),
        categorias = categorias ?? [];
}
