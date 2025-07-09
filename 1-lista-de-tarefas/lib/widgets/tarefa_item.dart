import 'package:flutter/material.dart';
import 'package:listadetarefas/models/tarefa.dart';
import 'package:listadetarefas/providers/tarefas_provider.dart';
import 'package:provider/provider.dart';

class TarefaItem extends StatefulWidget {
  final Tarefa tarefa;

  const TarefaItem({required this.tarefa, super.key});

  @override
  State<TarefaItem> createState() => _TarefaItemState();
}

class _TarefaItemState extends State<TarefaItem> {
  late final tarefa = widget.tarefa;
  late final _controller = TextEditingController(text: widget.tarefa.descricao);
  late final tarefasProvider = context.read<TarefasProvider>();

  @override
  void initState() {
    _controller.addListener(atualizarDescricao);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(atualizarDescricao);
    super.dispose();
  }

  void atualizarDescricao() {
    tarefa.descricao = _controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextField(
        controller: _controller,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: const InputDecoration(
          hintText: '(Tarefa vazia)',
          contentPadding: EdgeInsets.all(0),
          border: InputBorder.none,
          isDense: true,
        ),
        style: TextStyle(
          decoration: tarefa.concluida ? TextDecoration.lineThrough : null,
          color: tarefa.concluida ? Colors.grey : null,
        ),
      ),
      leading: Checkbox(
        value: tarefa.concluida,
        onChanged: (value) {
          tarefasProvider.concluir(tarefa, value ?? false);
        },
      ),
      trailing: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          final tarefasProvider = context.read<TarefasProvider>();
          tarefasProvider.remover(tarefa);
        },
      ),
    );
  }
}
