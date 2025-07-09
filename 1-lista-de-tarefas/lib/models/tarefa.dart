import 'package:uuid/uuid.dart';

class Tarefa {
  String id;
  String descricao;
  bool concluida = false;

  Tarefa({required this.descricao, this.concluida = false})
      : id = const Uuid().v4();
}
