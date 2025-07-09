import 'package:flutter/material.dart';

class NenhumProduto extends StatelessWidget {
  final bool paginaCarrinho;

  const NenhumProduto({super.key, this.paginaCarrinho = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              paginaCarrinho ? 'Carrinho vazio' : 'Nenhum produto cadastrado',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              paginaCarrinho
                  ? 'Adicione um produto ao carrinho clicando no botão "Adicionar ao Carrinho"'
                  : 'O administrador não cadastrou nenhum produto',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
