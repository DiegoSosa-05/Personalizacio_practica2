import 'package:flutter/material.dart';

import 'features/inicio/pantalla_inicio.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/appearance_controller.dart';
import 'features/tareas/habitos_controller.dart'; // <- NUEVA LÍNEA

void main() => runApp(const HabitaApp());

/// El controlador vive por encima de MaterialApp y está disponible para toda
/// la aplicación. Las pantallas futuras pueden recibirlo por constructor o
/// consultar HabitaApp.appearanceOf(context).
class HabitaApp extends StatefulWidget {
  const HabitaApp({super.key});

  static AppearanceController appearanceOf(BuildContext context) =>
      context.findAncestorStateOfType<_HabitaAppState>()!._appearance;

  @override
  State<HabitaApp> createState() => _HabitaAppState();
}

class _HabitaAppState extends State<HabitaApp> {
  final AppearanceController _appearance = AppearanceController();
  final HabitosController _habitos = HabitosController(); // <- NUEVA LÍNEA

  @override
  void dispose() {
    _appearance.dispose();
    _habitos.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => HabitosScope(
    // <- NUEVO
    controller: _habitos, // <- NUEVO
    child: AnimatedBuilder(
      animation: _appearance,
      builder: (context, _) => MaterialApp(
        title: 'Habita',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: _appearance.themeMode,
        home: const PantallaInicio(),
      ),
    ),
  );
}
