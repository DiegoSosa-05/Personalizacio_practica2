
import 'package:flutter/material.dart';

class TarjetaHabito extends StatelessWidget {
  final String nombre;
  final String descripcion;
  final IconData icono;
  final bool completado;
  final ValueChanged<bool> onChanged;

  const TarjetaHabito({
    super.key,
    required this.nombre,
    required this.descripcion,
    required this.icono,
    required this.completado,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: tema.colorScheme.primaryContainer,
          child: Icon(
            icono,
            color: tema.colorScheme.onPrimaryContainer,
          ),
        ),
        title: Text(nombre),
        subtitle: Text(descripcion),
        trailing: Checkbox(
          value: completado,
          onChanged: (valor) {
            if (valor != null) onChanged(valor);
          },
        ),
      ),
    );
  }
}
