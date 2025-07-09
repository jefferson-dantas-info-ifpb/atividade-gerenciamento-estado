import 'package:flutter/material.dart';

class ConcluidoIcone extends StatelessWidget {
  const ConcluidoIcone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.done,
        color: Theme.of(context).colorScheme.primary,
        size: 24,
      ),
    );
  }
}
