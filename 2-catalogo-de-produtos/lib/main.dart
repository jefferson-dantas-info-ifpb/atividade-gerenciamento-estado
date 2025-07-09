// Neste aplicativo de e-commerce, o usuário navega por uma lista de produtos, pode ver detalhes de cada
// item e adicionar/remover produtos de um carrinho de compras. O carrinho é acessível a partir de qualquer
// tela e exibe o total de itens e o valor da compra.
// Cenário prático:
//     O usuário explora a vitrine de produtos e, ao clicar em “adicionar ao carrinho”, o ícone do carrinho
// no topo da tela atualiza imediatamente o número de itens. Em outra tela, ele pode revisar o carrinho,
// remover produtos ou finalizar a compra. O estado do carrinho é global, permitindo que qualquer parte
//  app acesse e modifique suas informações.

import 'package:flutter/material.dart';
import 'package:catalogodeprodutos/models/produto.dart';
import 'package:catalogodeprodutos/pages/pagina_inicial.dart';
import 'package:catalogodeprodutos/providers/produtos_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProdutosProvider(produtos: <Produto>[
        Produto(
          nome: 'Pipoca',
          preco: 1.99,
          imagem:
              'https://www.chegouafeira.com.br/image/cache/catalog/7%C2%BA%20frente%20caixas/salgadinhos/Pipoca%20Bokus%2045g-500x500.png',
        ),
        Produto(
          nome: 'Caixa de bombons',
          preco: 11.59,
          imagem:
              'https://drogariavenancio.vtexassets.com/arquivos/ids/1172642/75415_z.jpg?v=638647890358800000',
        ),
        Produto(
          nome: 'Amaciante',
          preco: 7.80,
          imagem:
              'https://destro.fbitsstatic.net/img/p/amaciante-concentrado-downy-brisa-suave-leve-500ml-pague-450ml-87922/274919.jpg?w=500&h=500&v=202501231555&qs=ignore',
        ),
        Produto(
          nome: 'Iogurte',
          preco: 3.45,
          imagem:
              'https://www.davo.com.br/ccstore/v1/images/?source=/file/v5627926899122717866/products/prod_7891000340004.imagem1.jpg&height=940&width=940',
        ),
        Produto(
          nome: 'Shampoo',
          preco: 19.99,
          imagem:
              'https://images.tcdn.com.br/img/img_prod/763758/shampoo_dove_nutricao_fusao_de_oleos_400_ml_16538_1_9b7895ccdbc3bbbff86bd4db97d9e05f.jpg',
        ),
      ]),
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
      title: 'E-commerce',
      theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
      home: const PaginaInicial(),
    );
  }
}
