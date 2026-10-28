import 'package:flutter/material.dart';

import '../inicio/widgets/encabezado_inicio.dart';
import '../inicio/widgets/tarjeta_resumen.dart';
import '../inicio/widgets/tarjeta_habito.dart';

class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  final List<Map<String, dynamic>> habitos = [
    {
      'nombre': 'Leer',
      'descripcion': 'Leer durante 20 minutos',
      'icono': Icons.menu_book,
      'completado': false,
    },
    {
      'nombre': 'Estudiar',
      'descripcion': 'Repasar un tema de clase',
      'icono': Icons.school,
      'completado': false,
    },
    {
      'nombre': 'Beber agua',
      'descripcion': 'Tomar suficiente agua',
      'icono': Icons.water_drop,
      'completado': false,
    },
    {
      'nombre': 'Actividad física',
      'descripcion': 'Realizar 30 minutos de ejercicio',
      'icono': Icons.directions_run,
      'completado': false,
    },
  ];

  int get completados =>
      habitos.where((h) => h['completado'] as bool).length;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Habita'),
        centerTitle: false,
      ),
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
              completados: completados,
              total: habitos.length,
            ),
            const SizedBox(height: 24),

            Text(
              'Mis hábitos',
              style: tema.textTheme.titleLarge,
            ),
            const SizedBox(height: 12),

            ...habitos.map((habito) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TarjetaHabito(
                nombre: habito['nombre'] as String,
                descripcion: habito['descripcion'] as String,
                icono: habito['icono'] as IconData,
                completado: habito['completado'] as bool,
                onChanged: (valor) {
                  setState(() {
                    habito['completado'] = valor;
                  });
                },
              ),
            )),

            const SizedBox(height: 16),

            FilledButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'La pantalla completa de hábitos '
                      'se integrará próximamente.',
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.checklist),
              label: const Text('Ver mis hábitos'),
            ),
          ],
        ),
      ),
    );
  }
}
