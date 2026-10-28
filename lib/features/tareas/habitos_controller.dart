// lib/features/tareas/habitos_controller.dart
import 'package:flutter/material.dart';

import 'habito.dart';

class HabitosController extends ChangeNotifier {
  final List<Habito> _habitos = const [
    Habito(
      id: 'leer',
      nombre: 'Leer',
      descripcion: 'Leer durante 20 minutos',
      meta: '20 minutos',
      icono: Icons.menu_book,
    ),
    Habito(
      id: 'estudiar',
      nombre: 'Estudiar',
      descripcion: 'Repasar un tema de clase',
      meta: '1 tema',
      icono: Icons.school,
    ),
    Habito(
      id: 'agua',
      nombre: 'Beber agua',
      descripcion: 'Tomar suficiente agua',
      meta: '8 vasos',
      icono: Icons.water_drop,
    ),
    Habito(
      id: 'actividad',
      nombre: 'Actividad física',
      descripcion: 'Realizar 30 minutos de ejercicio',
      meta: '30 minutos',
      icono: Icons.directions_run,
    ),
  ].toList();

  List<Habito> get habitos => List.unmodifiable(_habitos);
  int get completados => _habitos.where((h) => h.completado).length;
  int get total => _habitos.length;

  void establecerCompletado(String id, bool valor) {
    final i = _habitos.indexWhere((h) => h.id == id);
    if (i == -1 || _habitos[i].completado == valor) return;
    _habitos[i] = _habitos[i].copiarCon(completado: valor);
    notifyListeners();
  }
}

class HabitosScope extends InheritedNotifier<HabitosController> {
  const HabitosScope({
    super.key,
    required HabitosController controller,
    required super.child,
  }) : super(notifier: controller);

  static HabitosController of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<HabitosScope>()!.notifier!;
}
