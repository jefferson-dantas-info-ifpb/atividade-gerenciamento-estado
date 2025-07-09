import 'package:catalogodeprodutos/pages/pagina_produto.dart';
import 'package:catalogodeprodutos/providers/produtos_provider.dart';
import 'package:flutter/material.dart';
import 'package:catalogodeprodutos/models/produto.dart';
import 'package:provider/provider.dart';

class ProdutoItem extends StatefulWidget {
  final Produto produto;

  const ProdutoItem({required this.produto, super.key});

  @override
  State<ProdutoItem> createState() => _ProdutoItemState();
}

class _ProdutoItemState extends State<ProdutoItem> {
  late final produto = widget.produto;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProdutosProvider>(
      builder: (context, value, child) {
        final produtosProvider = value;
        final estaNoCarrinho = produtosProvider.estaNoCarrinho(produto);

        return Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PaginaProduto(produto: produto),
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 125,
                  child: Hero(
                    tag: '${produto.id}-imagem',
                    child: Image.network(produto.imagem, height: 125),
                  ),
                ),
                const SizedBox(height: 3),
                Hero(
                  tag: '${produto.id}-nome',
                  child: Text(
                    produto.nome,
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Hero(
                  tag: '${produto.id}-preco',
                  child: Text(
                    'R\$ ${produto.preco.toStringAsFixed(2).replaceAll('.', ',')}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 3),
                Hero(
                  tag: '${produto.id}-carrinho',
                  child: TextButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          estaNoCarrinho
                              ? Icons.remove_shopping_cart
                              : Icons.add_shopping_cart,
                        ),
                        const SizedBox(width: 16),
                        const Text('Carrinho')
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
        );

        return ListTile(
          title: Text(produto.nome),
          trailing: IconButton(
            icon: Icon(
              estaNoCarrinho
                  ? Icons.remove_shopping_cart
                  : Icons.add_shopping_cart,
            ),
            tooltip: estaNoCarrinho
                ? 'Remover do carrinho'
                : 'Adicionar ao carrinho',
            onPressed: () {
              if (estaNoCarrinho) {
                produtosProvider.removerDoCarrinho(produto);
              } else {
                produtosProvider.adicionarAoCarrinho(produto);
              }
            },
          ),
          onTap: () {},
        );
      },
    );
  }
}
