import 'package:flutter/material.dart';

class NenhumaNota extends StatelessWidget {
  final bool paginaFavoritos;

  const NenhumaNota({super.key, this.paginaFavoritos = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              paginaFavoritos ? 'Nenhuma nota favorita' : 'Nenhuma nota',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              paginaFavoritos
                  ? 'Pressione o botão coração para adicionar uma nota aos favoritos'
                  : 'Cadastre uma nova nota clicando no botão + abaixo',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
