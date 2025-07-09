import 'package:flutter/material.dart';
import 'package:catalogodeprodutos/providers/produtos_provider.dart';
import 'package:catalogodeprodutos/widgets/app_bar.dart';
import 'package:catalogodeprodutos/widgets/nenhum_produto.dart';
import 'package:catalogodeprodutos/widgets/produto_item.dart';
import 'package:provider/provider.dart';

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Loja'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ProdutosProvider>(
          builder: (context, value, child) {
            final produtos = value.produtos;

            if (produtos.isEmpty) {
              return const NenhumProduto();
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.75,
              ),
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                return ProdutoItem(
                  produto: produtos[index],
                  key: Key(produtos[index].id),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
