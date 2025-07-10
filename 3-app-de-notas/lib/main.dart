// Este aplicativo permite ao usuário criar notas, atribuir categorias (como “trabalho”,
// “estudos” ou “pessoal”) e marcar notas favoritas. Diferentes widgets exibem listas
// filtradas (por categoria ou favoritos), além de contadores de notas em cada categoria.
// Cenário prático:
//     Na tela inicial, o usuário vê todas as notas. Ele pode filtrar por categoria usando
// abas ou menus. Um widget mostra quantas notas existem em cada categoria. Ao favoritar
// uma nota, ela aparece automaticamente na seção de favoritos, acessível de qualquer parte
// do app.

import 'package:appdenotas/models/categoria.dart';
import 'package:flutter/material.dart';
import 'package:appdenotas/models/nota.dart';
import 'package:appdenotas/pages/pagina_inicial.dart';
import 'package:appdenotas/providers/notas_provider.dart';
import 'package:provider/provider.dart';

final notas = <Nota>[
  Nota(
    conteudo: 'Comprar presente de aniversário',
    categorias: [Categoria(nome: 'Pessoal')],
  ),
  Nota(
    conteudo: 'Enviar relatório mensal',
    categorias: [Categoria(nome: 'Trabalho'), Categoria(nome: 'Urgente')],
  ),
  Nota(
    conteudo: 'Agendar consulta médica',
    categorias: [Categoria(nome: 'Pessoal'), Categoria(nome: 'Urgente')],
  ),
  Nota(
    conteudo: 'Planejar reunião com cliente',
    categorias: [Categoria(nome: 'Trabalho')],
  ),
];

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NotasProvider(notas: notas),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anotações',
      theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
      home: const PaginaInicial(),
    );
  }
}
