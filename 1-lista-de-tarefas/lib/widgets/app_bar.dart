import 'package:flutter/material.dart';
import 'package:listadetarefas/providers/tarefas_provider.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      actions: [
        Consumer<TarefasProvider>(
          builder: (context, value, child) {
            final pendentes =
                value.tarefas.where((element) => !element.concluida).length;
            final concluidas =
                value.tarefas.where((element) => element.concluida).length;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Pendentes: $pendentes'),
                  Text('Concluídas: $concluidas'),
                ],
              ),
            );
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
