// lib/features/tareas/habito.dart
import 'package:flutter/material.dart';

class Habito {
  const Habito({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.meta,
    required this.icono,
    this.completado = false,
  });

  final String id;
  final String nombre;
  final String descripcion;
  final String meta; // ej. "20 minutos"
  final IconData icono;
  final bool completado;

  Habito copiarCon({bool? completado}) => Habito(
    id: id,
    nombre: nombre,
    descripcion: descripcion,
    meta: meta,
    icono: icono,
    completado: completado ?? this.completado,
  );
}
