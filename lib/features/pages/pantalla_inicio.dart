import 'package:flutter/material.dart';

import '../inicio/widgets/encabezado_inicio.dart';
import '../inicio/widgets/tarjeta_resumen.dart';
import '../inicio/widgets/tarjeta_habito.dart';
import '../tareas/habitos_controller.dart';
import '../../core/widgets/barra_navegacion_app.dart';
import '../tareas/pantalla_mis_habitos.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    final controlador = HabitosScope.of(context);
    final tema = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: const BarraNavegacionApp(indiceActual: 0),
      appBar: AppBar(title: const Text('Habita'), centerTitle: false),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const EncabezadoInicio(
              titulo: '¡Hola! Vamos paso a paso',
              subtitulo: 'Es momento de revisar tus hábitos del día.',
            ),
            const SizedBox(height: 24),

            TarjetaResumen(
              completados: controlador.completados,
              total: controlador.total,
            ),
            const SizedBox(height: 24),

            Text('Mis hábitos', style: tema.textTheme.titleLarge),
            const SizedBox(height: 12),

            ...controlador.habitos.map(
              (h) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TarjetaHabito(
                  nombre: h.nombre,
                  descripcion: h.descripcion,
                  icono: h.icono,
                  completado: h.completado,
                  onChanged: (valor) =>
                      controlador.establecerCompletado(h.id, valor),
                ),
              ),
            ),

            const SizedBox(height: 16),

            FilledButton.icon(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const PantallaMisHabitos()),
              ),
              icon: const Icon(Icons.checklist),
              label: const Text('Ver mis hábitos'),
            ),
          ],
        ),
      ),
    );
  }
}
