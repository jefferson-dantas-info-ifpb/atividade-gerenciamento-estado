import 'package:uuid/uuid.dart';

class Produto {
  String id;
  String nome;
  String imagem;
  double preco;

  Produto({
    required this.nome,
    required this.preco,
    required this.imagem,
  }) : id = const Uuid().v4();
}
