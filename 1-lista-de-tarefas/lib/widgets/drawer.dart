import 'package:flutter/material.dart';
import 'package:listadetarefas/pages/tarefas_concluidas.dart';
import 'package:listadetarefas/pages/tarefas_pendentes.dart';
import 'package:listadetarefas/pages/todas_tarefas.dart';

class MyDrawer extends StatelessWidget {
  final String paginaAtual;

  const MyDrawer({super.key, required this.paginaAtual});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Todas as Tarefas'),
            tileColor: paginaAtual == 'todas-tarefas'
                ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
                : null,
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const TodasTarefas(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Tarefas Pendentes'),
            tileColor: paginaAtual == 'tarefas-pendentes'
                ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
                : null,
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const TarefasPendentes(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Tarefas Concluídas'),
            tileColor: paginaAtual == 'tarefas-concluidas'
                ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
                : null,
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const TarefasConcluidas(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
