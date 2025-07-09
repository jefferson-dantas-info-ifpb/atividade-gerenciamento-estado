import 'package:flutter/material.dart';
import 'package:catalogodeprodutos/models/produto.dart';

class ProdutosProvider with ChangeNotifier {
  List<Produto> produtos = [];
  List<Produto> carrinho = [];

  ProdutosProvider({required this.produtos});

  adicionarAoCarrinho(Produto produto) {
    if (estaNoCarrinho(produto)) {
      return;
    }

    carrinho.add(produto);
    notifyListeners();
  }

  removerDoCarrinho(Produto produto) {
    carrinho.remove(produto);
    notifyListeners();
  }

  estaNoCarrinho(Produto produto) {
    return carrinho.contains(produto);
  }
}
