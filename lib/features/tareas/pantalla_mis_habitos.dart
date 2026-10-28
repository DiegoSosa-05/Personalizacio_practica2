import 'package:flutter/material.dart';

import '../../core/widgets/barra_navegacion_app.dart';
import '../../core/widgets/encabezado_seccion.dart';
import '../inicio/widgets/tarjeta_habito.dart';
import '../inicio/widgets/tarjeta_resumen.dart';
import 'habitos_controller.dart';

class PantallaMisHabitos extends StatelessWidget {
  const PantallaMisHabitos({super.key});

  @override
  Widget build(BuildContext context) {
    final c = HabitosScope.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Mis hábitos'), centerTitle: false),
      bottomNavigationBar: const BarraNavegacionApp(indiceActual: 1),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, box) {
            const margen = 20.0;
            const espacio = 12.0;
            final columnas = box.maxWidth >= 900
                ? 3
                : box.maxWidth >= 600
                ? 2
                : 1;
            final ancho =
                (box.maxWidth - margen * 2 - espacio * (columnas - 1)) /
                columnas;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(margen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TarjetaResumen(completados: c.completados, total: c.total),
                  const SizedBox(height: 24),
                  const EncabezadoSeccion(
                    titulo: 'Hábitos de hoy',
                    subtitulo: 'Meta diaria y estado de cada hábito',
                  ),
                  Wrap(
                    spacing: espacio,
                    runSpacing: espacio,
                    children: [
                      for (final h in c.habitos)
                        SizedBox(
                          width: ancho,
                          child: TarjetaHabito(
                            nombre: h.nombre,
                            descripcion: h.descripcion,
                            icono: h.icono,
                            completado: h.completado,
                            detalle:
                                'Meta: ${h.meta} · ${h.completado ? "Cumplido" : "Pendiente"}',
                            onChanged: (v) => c.establecerCompletado(h.id, v),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
