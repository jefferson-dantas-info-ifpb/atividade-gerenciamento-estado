import 'package:flutter/material.dart';

class NenhumaTarefa extends StatelessWidget {
  final bool paginaConcluidas;

  const NenhumaTarefa({super.key, this.paginaConcluidas = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Nenhuma tarefa cadastrada',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              paginaConcluidas
                  ? 'Cadastre uma nova tarefa na página "Todas as Tarefas" usando a caixa de texto'
                  : 'Cadastre uma nova tarefa usando a caixa de texto abaixo',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
