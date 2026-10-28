import 'package:flutter/material.dart';

import '../../features/inicio/pantalla_inicio.dart';
import '../../features/tareas/pantalla_mis_habitos.dart';
import '../../features/configuracion/pantalla_configuracion.dart';

class BarraNavegacionApp extends StatelessWidget {
  final int indiceActual;

  const BarraNavegacionApp({super.key, required this.indiceActual});

  void _ir(BuildContext context, int indice) {
    if (indice == indiceActual) return;

    final destinos = <Widget Function()>[
      () => const PantallaInicio(),
      // Se agregan al crear las otras pantallas:
      () => const PantallaMisHabitos(),
      () => const PantallaConfiguracion(),
    ];

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => destinos[indice]()));
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: indiceActual,
      onDestinationSelected: (i) => _ir(context, i),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Inicio',
        ),
        NavigationDestination(
          icon: Icon(Icons.checklist_outlined),
          selectedIcon: Icon(Icons.checklist),
          label: 'Mis hábitos',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
          label: 'Configuración',
        ),
      ],
    );
  }
}
