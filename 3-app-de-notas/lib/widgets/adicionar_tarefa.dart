import 'package:flutter/material.dart';
import 'package:appdenotas/models/nota.dart';
import 'package:appdenotas/providers/notas_provider.dart';
import 'package:provider/provider.dart';

class AdicionarTarefa extends StatefulWidget {
  const AdicionarTarefa({super.key});

  @override
  State<AdicionarTarefa> createState() => _AdicionarTarefaState();
}

class _AdicionarTarefaState extends State<AdicionarTarefa> {
  final _tarefa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        controller: _tarefa,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
          hintText: 'Digite uma tarefa...',
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          border: const OutlineInputBorder(),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              tooltip: 'Adicionar Tarefa',
              onPressed: () {
                final tarefasProvider = context.read<NotasProvider>();
                if (_tarefa.text.trim() == '') return;
                tarefasProvider.adicionar(Nota(conteudo: _tarefa.text));
                setState(() {
                  _tarefa.text = '';
                });
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}
