import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/appearance_controller.dart';

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

  @override
  void dispose() {
    _appearance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _appearance,
        builder: (context, _) => MaterialApp(
          title: 'Habita',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: _appearance.themeMode,
          home: const ThemeDemoScreen(),
        ),
      );
}

/// Pantalla temporal para comprobar el tema global. Se sustituirá al integrar
/// las pantallas definitivas de Inicio y Configuración.
class ThemeDemoScreen extends StatelessWidget {
  const ThemeDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appearance = HabitaApp.appearanceOf(context);
    final scheme = Theme.of(context).colorScheme;
    final selected = appearance.themeMode;

    return Scaffold(
      appBar: AppBar(title: const Text('Habita · demostración')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Cuida tus hábitos, un día a la vez', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text('Vista provisional del sistema de apariencia.', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Icon(Icons.spa_outlined, color: scheme.primary),
                  const SizedBox(width: 12),
                  Text('Progreso de hoy', style: Theme.of(context).textTheme.titleMedium),
                ]),
                const SizedBox(height: 16),
                Text('2 de 4 hábitos completados', style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 12),
                LinearProgressIndicator(value: .5, minHeight: 8, borderRadius: BorderRadius.circular(8)),
              ]),
            ),
          ),
          const SizedBox(height: 24),
          Text('Modo de apariencia', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          SegmentedButton<ThemeMode>(
            segments: const [
              ButtonSegment(value: ThemeMode.light, label: Text('Claro'), icon: Icon(Icons.light_mode_outlined)),
              ButtonSegment(value: ThemeMode.dark, label: Text('Oscuro'), icon: Icon(Icons.dark_mode_outlined)),
              ButtonSegment(value: ThemeMode.system, label: Text('Sistema'), icon: Icon(Icons.settings_brightness_outlined)),
            ],
            selected: {selected},
            onSelectionChanged: (selection) => appearance.setThemeMode(selection.first),
          ),
          const SizedBox(height: 12),
          Text('Seleccionado: ${_modeName(selected)}', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 20),
          Wrap(spacing: 12, runSpacing: 12, children: [
            ElevatedButton(onPressed: () {}, child: const Text('Acción principal')),
            OutlinedButton(onPressed: () {}, child: const Text('Acción secundaria')),
          ]),
        ],
      ),
    );
  }

  String _modeName(ThemeMode mode) => switch (mode) {
        ThemeMode.light => 'Claro',
        ThemeMode.dark => 'Oscuro',
        ThemeMode.system => 'Sistema',
      };
}
