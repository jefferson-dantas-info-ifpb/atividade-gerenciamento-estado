import 'package:appdenotas/models/nota.dart';
import 'package:appdenotas/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:appdenotas/widgets/editar_nota.dart';

class EditarNotaPagina extends StatelessWidget {
  final Nota nota;

  const EditarNotaPagina({required this.nota, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Editar nota'),
      body: EditarNota(nota: nota),
    );
  }
}
