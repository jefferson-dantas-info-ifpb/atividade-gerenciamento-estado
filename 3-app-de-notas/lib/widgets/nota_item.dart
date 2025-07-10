import 'package:appdenotas/pages/editar_nota.dart';
import 'package:flutter/material.dart';
import 'package:appdenotas/models/nota.dart';
import 'package:appdenotas/providers/notas_provider.dart';
import 'package:provider/provider.dart';

class TarefaItem extends StatefulWidget {
  final Nota nota;

  const TarefaItem({required this.nota, super.key});

  @override
  State<TarefaItem> createState() => _TarefaItemState();
}

class _TarefaItemState extends State<TarefaItem> {
  late final nota = widget.nota;
  late final notasProvider = context.read<NotasProvider>();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditarNotaPagina(nota: widget.nota),
            ),
          );
          notasProvider.atualizar();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  nota.conteudo,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              IconButton(
                icon: Icon(
                  nota.favorita ? Icons.favorite : Icons.favorite_border,
                  color: nota.favorita ? Colors.red : null,
                ),
                tooltip: 'Favoritar',
                onPressed: () {
                  notasProvider.favoritar(nota);
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                tooltip: 'Excluir',
                onPressed: () {
                  notasProvider.remover(nota);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
