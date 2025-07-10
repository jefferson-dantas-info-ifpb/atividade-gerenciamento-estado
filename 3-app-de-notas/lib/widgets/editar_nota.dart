import 'package:appdenotas/models/nota.dart';
import 'package:appdenotas/widgets/editar_categorias.dart';
import 'package:flutter/material.dart';

class EditarNota extends StatefulWidget {
  final Nota nota;

  const EditarNota({required this.nota, super.key});

  @override
  State<EditarNota> createState() => _EditarNotaState();
}

class _EditarNotaState extends State<EditarNota> {
  late final _conteudo = TextEditingController(text: widget.nota.conteudo);

  @override
  void initState() {
    _conteudo.addListener(atualizarDescricao);
    super.initState();
  }

  @override
  void dispose() {
    _conteudo.removeListener(atualizarDescricao);
    super.dispose();
  }

  void atualizarDescricao() {
    widget.nota.conteudo = _conteudo.text;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: EditarCategorias(nota: widget.nota),
        ),
        TextField(
          controller: _conteudo,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: const InputDecoration(
            hintText: 'Digite...',
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            border: InputBorder.none,
          ),
        ),
      ],
    );
  }
}
