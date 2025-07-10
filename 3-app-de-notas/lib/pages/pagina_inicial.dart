import 'package:appdenotas/models/nota.dart';
import 'package:appdenotas/pages/editar_nota.dart';
import 'package:appdenotas/widgets/categoria_chip.dart';
import 'package:flutter/material.dart';
import 'package:appdenotas/providers/notas_provider.dart';
import 'package:appdenotas/widgets/app_bar.dart';
import 'package:appdenotas/widgets/nenhuma_nota.dart';
import 'package:appdenotas/widgets/nota_item.dart';
import 'package:provider/provider.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  @override
  Widget build(BuildContext context) {
    final notasProvider = context.watch<NotasProvider>();

    final notas = notasProvider.notas;

    return Scaffold(
      appBar: const MyAppBar(title: 'Anotações'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CategoriaChip(
                    valor: null,
                    selected: notasProvider.filtroCategoria == null,
                  ),
                  ...notasProvider.categorias.map(
                    (categoria) => Row(
                      children: [
                        const SizedBox(width: 8),
                        CategoriaChip(
                          valor: categoria,
                          selected: notasProvider.filtroCategoria == categoria,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: notas.isEmpty
                  ? const NenhumaNota()
                  : ListView.builder(
                      itemCount: notas.length,
                      itemBuilder: (context, index) => TarefaItem(
                        nota: notas[index],
                        key: Key(notas[index].id),
                      ),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nota = Nota(conteudo: '', categorias: []);
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditarNotaPagina(nota: nota),
            ),
          );
          if (nota.conteudo.trim() == '') return;
          notasProvider.adicionar(nota);
        },
        tooltip: 'Adicionar nota',
        child: const Icon(Icons.add),
      ),
    );
  }
}
