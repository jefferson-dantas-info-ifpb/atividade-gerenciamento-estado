import 'package:catalogodeprodutos/widgets/nenhum_produto.dart';
import 'package:catalogodeprodutos/widgets/produto_item.dart';
import 'package:flutter/material.dart';
import 'package:catalogodeprodutos/providers/produtos_provider.dart';
import 'package:catalogodeprodutos/widgets/app_bar.dart';
import 'package:provider/provider.dart';

class PaginaCarrinho extends StatelessWidget {
  const PaginaCarrinho({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Carrinho de compras'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ProdutosProvider>(
          builder: (context, value, child) {
            final produtosProvider = value;
            final carrinho = produtosProvider.carrinho;

            if (carrinho.isEmpty) {
              return const NenhumProduto(paginaCarrinho: true);
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.75,
              ),
              itemCount: carrinho.length,
              itemBuilder: (context, index) {
                return ProdutoItem(
                  produto: carrinho[index],
                  key: Key(carrinho[index].id),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
