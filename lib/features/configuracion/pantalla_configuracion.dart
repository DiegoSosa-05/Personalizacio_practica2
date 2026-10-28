import 'package:flutter/material.dart';

import '../../core/widgets/barra_navegacion_app.dart';
import '../../core/widgets/encabezado_seccion.dart';
import '../../core/widgets/opcion_apariencia.dart';
import '../../main.dart';

class PantallaConfiguracion extends StatelessWidget {
  const PantallaConfiguracion({super.key});

  @override
  Widget build(BuildContext context) {
    final apariencia = HabitaApp.appearanceOf(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Configuración'), centerTitle: false),
      bottomNavigationBar: const BarraNavegacionApp(indiceActual: 2),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: ListenableBuilder(
              listenable: apariencia,
              builder: (context, _) {
                final actual = apariencia.themeMode;

                Widget opcion(ThemeMode modo, IconData icono, String titulo) =>
                    OpcionApariencia(
                      icono: icono,
                      titulo: titulo,
                      seleccionada: actual == modo,
                      onTap: () => apariencia.setThemeMode(modo),
                    );

                return ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    const EncabezadoSeccion(
                      titulo: 'Apariencia',
                      subtitulo: 'Elige cómo se ve Habita',
                    ),
                    opcion(ThemeMode.light, Icons.light_mode_outlined, 'Claro'),
                    opcion(ThemeMode.dark, Icons.dark_mode_outlined, 'Oscuro'),
                    opcion(
                      ThemeMode.system,
                      Icons.settings_brightness_outlined,
                      'Sistema',
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
