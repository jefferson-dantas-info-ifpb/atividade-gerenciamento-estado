import 'package:flutter/material.dart';
import 'package:listadetarefas/providers/tarefas_provider.dart';
import 'package:listadetarefas/widgets/concluido_icone.dart';
import 'package:provider/provider.dart';

class Resumo extends StatelessWidget {
  const Resumo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TarefasProvider>(
      builder: (context, value, child) {
        final total = value.tarefas.length;
        final pendentes =
            value.tarefas.where((element) => !element.concluida).length;

        String titulo = 'Parabéns!';
        String subtitulo = 'Todas as tarefas foram concluídas';

        if (total == 0) {
          titulo = 'Não há tarefas';
          subtitulo = 'Crie novas tarefas';
        } else if (pendentes == total) {
          titulo = 'Hora de começar!';
          subtitulo = 'Todas as tarefas pendentes';
        } else if (pendentes == 1) {
          titulo = 'Quase lá!';
          subtitulo = '1 tarefa pendente';
        } else if (pendentes > 1) {
          titulo = 'Você consegue!';
          subtitulo = '$pendentes tarefas pendentes';
        }

        if (total == 0) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Row(
            children: [
              if (pendentes == 0 && total >= 1) const ConcluidoIcone(),
              if (pendentes > 0 && total >= 1)
                CircularProgressIndicator(value: pendentes / total),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(subtitulo),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
