import 'package:appdenotas/providers/notas_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriaChip extends StatelessWidget {
  final String? valor;
  final bool selected;

  const CategoriaChip({required this.valor, required this.selected, super.key});

  @override
  Widget build(BuildContext context) {
    final notasProvider = context.read<NotasProvider>();

    return InkWell(
      onTap: selected
          ? null
          : () {
              notasProvider.setFiltroCategoria(valor);
            },
      borderRadius: BorderRadius.circular(999),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .primary
              .withOpacity(selected ? 1 : 0.1),
          borderRadius: BorderRadius.circular(999),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Text(
          valor ?? 'Todas',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: selected ? Colors.white : null,
          ),
        ),
      ),
    );
  }
}
