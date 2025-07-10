import 'package:flutter/material.dart';
import 'package:appdenotas/models/nota.dart';

class NotasProvider with ChangeNotifier {
  final List<Nota> _notas;
  String? filtroCategoria;

  NotasProvider({required notas}) : _notas = notas;

  List<Nota> get notas {
    if (filtroCategoria != null) {
      return _notas
          .where((nota) => nota.categorias
              .any((categoria) => categoria.nome == filtroCategoria))
          .toList();
    }

    return _notas;
  }

  List<Nota> get favoritas {
    return _notas.where((nota) => nota.favorita).toList();
  }

  List<String> get categorias {
    final Set<String> categoriasUnicas = {};

    for (var nota in _notas) {
      for (var categoria in nota.categorias) {
        categoriasUnicas.add(categoria.nome);
      }
    }

    return categoriasUnicas.toList();
  }

  favoritar(Nota nota) {
    nota.favorita = !nota.favorita;
    notifyListeners();
  }

  adicionar(Nota nota) {
    _notas.add(nota);
    notifyListeners();
  }

  remover(Nota nota) {
    _notas.remove(nota);
    notifyListeners();
  }

  atualizar() {
    notifyListeners();
  }

  setFiltroCategoria(String? categoria) {
    filtroCategoria = categoria;
    notifyListeners();
  }
}
