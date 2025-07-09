// Imagine um aplicativo onde várias partes da interface trabalham juntas para gerenciar tarefas.
// O usuário pode adicionar novas tarefas, marcar como concluídas, remover itens e aplicar filtros
// (como “todas”, “pendentes” ou “concluídas”). Além da lista principal, há um widget que exibe o
// número de tarefas pendentes e outro que mostra apenas as tarefas concluídas.
// Cenário prático:
//   Você está em uma tela principal com a lista de tarefas. No topo, um contador exibe quantas
// tarefas ainda precisam ser feitas. Um menu lateral permite filtrar as tarefas por status. Ao
// marcar uma tarefa como concluída, tanto a lista quanto o contador são atualizados automaticamente,
// pois ambos consomem o mesmo estado global.

import 'package:flutter/material.dart';
import 'package:listadetarefas/models/tarefa.dart';
import 'package:listadetarefas/pages/todas_tarefas.dart';
import 'package:listadetarefas/providers/tarefas_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TarefasProvider(tarefas: <Tarefa>[
        Tarefa(descricao: 'Passear com o gato'),
        Tarefa(descricao: 'Terminar exercício', concluida: true),
        Tarefa(descricao: 'Continuar projeto'),
        Tarefa(descricao: 'Tomar banho'),
      ]),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Tarefas',
      theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
      home: const TodasTarefas(),
    );
  }
}
