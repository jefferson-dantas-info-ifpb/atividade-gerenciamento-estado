import 'package:flutter/material.dart';
import 'package:listadetarefas/providers/tarefas_provider.dart';
import 'package:listadetarefas/widgets/app_bar.dart';
import 'package:listadetarefas/widgets/drawer.dart';
import 'package:listadetarefas/widgets/nenhuma_tarefa.dart';
import 'package:listadetarefas/widgets/tarefa_item.dart';
import 'package:provider/provider.dart';

class TarefasConcluidas extends StatelessWidget {
  const TarefasConcluidas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Tarefas Concluídas'),
      drawer: const MyDrawer(paginaAtual: 'tarefas-concluidas'),
      body: Column(
        children: [
          Expanded(
            child: Consumer<TarefasProvider>(
              builder: (context, value, child) {
                final tarefas =
                    value.tarefas.where((tarefa) => tarefa.concluida).toList();

                if (tarefas.isEmpty) {
                  return const NenhumaTarefa(paginaConcluidas: true);
                }

                return ListView.builder(
                  itemCount: tarefas.length,
                  itemBuilder: (context, index) => TarefaItem(
                    tarefa: tarefas[index],
                    key: Key(tarefas[index].id),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
