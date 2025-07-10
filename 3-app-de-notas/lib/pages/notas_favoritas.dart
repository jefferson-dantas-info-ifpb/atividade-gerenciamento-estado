import 'package:flutter/material.dart';
import 'package:appdenotas/providers/notas_provider.dart';
import 'package:appdenotas/widgets/app_bar.dart';
import 'package:appdenotas/widgets/nenhuma_nota.dart';
import 'package:appdenotas/widgets/nota_item.dart';
import 'package:provider/provider.dart';

class NotasFavoritasPagina extends StatelessWidget {
  const NotasFavoritasPagina({super.key});

  @override
  Widget build(BuildContext context) {
    final notasProvider = context.watch<NotasProvider>();
    final favoritas = notasProvider.favoritas;

    return Scaffold(
      appBar: const MyAppBar(title: 'Notas favoritas'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: favoritas.isEmpty
                  ? const NenhumaNota(paginaFavoritos: true)
                  : ListView.builder(
                      itemCount: favoritas.length,
                      itemBuilder: (context, index) => TarefaItem(
                        nota: favoritas[index],
                        key: Key(favoritas[index].id),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
