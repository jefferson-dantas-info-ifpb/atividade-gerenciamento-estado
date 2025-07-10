import 'package:uuid/uuid.dart';

class Categoria {
  String id;
  String nome;

  Categoria({required this.nome}) : id = const Uuid().v4();
}
