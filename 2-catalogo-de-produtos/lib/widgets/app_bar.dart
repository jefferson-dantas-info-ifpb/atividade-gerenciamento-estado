import 'package:catalogodeprodutos/pages/pagina_carrinho.dart';
import 'package:catalogodeprodutos/providers/produtos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      actions: [
        Consumer<ProdutosProvider>(
          builder: (context, value, child) {
            final tamanhoCarrinho = value.carrinho.length;

            return IconButton(
              icon: Badge.count(
                count: tamanhoCarrinho,
                isLabelVisible: tamanhoCarrinho > 0,
                child: const Icon(Icons.shopping_cart),
              ),
              tooltip: 'Carrinho',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PaginaCarrinho(),
                  ),
                );
              },
            );
          },
        ),
        const SizedBox(width: 16)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
