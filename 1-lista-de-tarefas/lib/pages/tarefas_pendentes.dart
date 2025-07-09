import 'package:flutter/material.dart';
import 'package:listadetarefas/providers/tarefas_provider.dart';
import 'package:listadetarefas/widgets/adicionar_tarefa.dart';
import 'package:listadetarefas/widgets/app_bar.dart';
import 'package:listadetarefas/widgets/drawer.dart';
import 'package:listadetarefas/widgets/nenhuma_tarefa.dart';
import 'package:listadetarefas/widgets/tarefa_item.dart';
import 'package:provider/provider.dart';

class TarefasPendentes extends StatelessWidget {
  const TarefasPendentes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Tarefas Pendentes'),
      drawer: const MyDrawer(paginaAtual: 'tarefas-pendentes'),
      body: Column(
        children: [
          Expanded(
            child: Consumer<TarefasProvider>(
              builder: (context, value, child) {
                final tarefas =
                    value.tarefas.where((tarefa) => !tarefa.concluida).toList();

                if (tarefas.isEmpty) {
                  return const NenhumaTarefa();
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
          const AdicionarTarefa()
        ],
      ),
    );
  }
}
