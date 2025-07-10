import 'package:appdenotas/models/categoria.dart';
import 'package:appdenotas/models/nota.dart';
import 'package:flutter/material.dart';

class EditarCategorias extends StatefulWidget {
  final Nota nota;

  const EditarCategorias({required this.nota, super.key});

  @override
  State<EditarCategorias> createState() => _EditarCategoriaState();
}

class _EditarCategoriaState extends State<EditarCategorias> {
  late final _categorias = widget.nota.categorias;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Wrap(
        spacing: 8,
        children: [
          ..._categorias.map((categoria) {
            return Container(
              key: Key(categoria.id),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(999),
              ),
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IntrinsicWidth(
                    child: TextFormField(
                      initialValue: categoria.nome,
                      onChanged: (value) => categoria.nome = value,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: 'Digite...',
                        contentPadding: EdgeInsets.all(0),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _categorias.remove(categoria);
                      });
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            );
          }),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(999),
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  _categorias.add(Categoria(nome: ''));
                });
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
