import 'package:flutter/material.dart';

class EncabezadoSeccion extends StatelessWidget {
  final String titulo;
  final String? subtitulo;

  const EncabezadoSeccion({super.key, required this.titulo, this.subtitulo});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo, style: tema.titleLarge),
          if (subtitulo != null) ...[
            const SizedBox(height: 4),
            Text(subtitulo!, style: tema.bodySmall),
          ],
        ],
      ),
    );
  }
}
