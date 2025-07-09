import 'package:catalogodeprodutos/models/produto.dart';
import 'package:flutter/material.dart';
import 'package:catalogodeprodutos/providers/produtos_provider.dart';
import 'package:catalogodeprodutos/widgets/app_bar.dart';
import 'package:provider/provider.dart';

class PaginaProduto extends StatelessWidget {
  final Produto produto;

  const PaginaProduto({required this.produto, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: produto.nome),
      body: Consumer<ProdutosProvider>(
        builder: (context, value, child) {
          final produtosProvider = value;
          final estaNoCarrinho = produtosProvider.estaNoCarrinho(produto);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                child: Center(
                  child: Hero(
                    tag: '${produto.id}-imagem',
                    child: Image.network(produto.imagem, height: 200),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Hero(
                      tag: '${produto.id}-nome',
                      child: Text(
                        produto.nome,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: 36),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Hero(
                      tag: '${produto.id}-preco',
                      child: Text(
                        'R\$ ${produto.preco.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Hero(
                      tag: '${produto.id}-carrinho',
                      child: ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              estaNoCarrinho
                                  ? Icons.remove_shopping_cart
                                  : Icons.add_shopping_cart,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              estaNoCarrinho
                                  ? 'Remover do carrinho'
                                  : 'Adicionar ao carrinho',
                            )
                          ],
                        ),
                        onPressed: () {
                          if (estaNoCarrinho) {
                            produtosProvider.removerDoCarrinho(produto);
                          } else {
                            produtosProvider.adicionarAoCarrinho(produto);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
