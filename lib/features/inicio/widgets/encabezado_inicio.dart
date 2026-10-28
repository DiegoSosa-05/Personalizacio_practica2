
import 'package:flutter/material.dart';

class EncabezadoInicio extends StatelessWidget {
  final String titulo;
  final String subtitulo;

  const EncabezadoInicio({
    super.key,
    required this.titulo,
    required this.subtitulo,
  });

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titulo, style: tema.textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text(
                subtitulo,
                style: tema.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        Icon(
          Icons.spa_rounded,
          size: 38,
          color: tema.colorScheme.primary,
        ),
      ],
    );
  }
}