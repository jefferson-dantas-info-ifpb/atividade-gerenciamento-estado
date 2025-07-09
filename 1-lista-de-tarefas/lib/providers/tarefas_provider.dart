import 'package:flutter/material.dart';
import 'package:listadetarefas/models/tarefa.dart';

class TarefasProvider with ChangeNotifier {
  List<Tarefa> tarefas = [];

  TarefasProvider({required this.tarefas});

  concluir(Tarefa tarefa, bool concluida) {
    tarefa.concluida = concluida;
    notifyListeners();
  }

  adicionar(Tarefa tarefa) {
    tarefas.add(tarefa);
    notifyListeners();
  }

  remover(Tarefa tarefa) {
    tarefas.remove(tarefa);
    notifyListeners();
  }
}
