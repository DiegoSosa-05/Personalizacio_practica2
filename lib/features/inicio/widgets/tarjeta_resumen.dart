
import 'package:flutter/material.dart';

class TarjetaResumen extends StatelessWidget {
  final int completados;
  final int total;

  const TarjetaResumen({
    super.key,
    required this.completados,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;
    final progreso = total == 0 ? 0.0 : completados / total;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tu progreso de hoy',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Text('$completados de $total hábitos completados'),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: progreso,
              minHeight: 9,
              borderRadius: BorderRadius.circular(10),
              color: colores.primary,
              backgroundColor: colores.surfaceContainerHighest,
            ),
            const SizedBox(height: 8),
            Text('${(progreso * 100).round()}% completado'),
          ],
        ),
      ),
    );
  }
}
