import 'package:flutter/material.dart';

class OpcionApariencia extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final bool seleccionada;
  final VoidCallback onTap;

  const OpcionApariencia({
    super.key,
    required this.icono,
    required this.titulo,
    required this.seleccionada,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;

    return Card(
      color: seleccionada ? colores.primaryContainer : null,
      child: ListTile(
        leading: Icon(icono),
        title: Text(titulo),
        trailing: seleccionada
            ? Icon(Icons.check_circle, color: colores.primary)
            : null,
        onTap: onTap,
      ),
    );
  }
}
