import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalizacion_practica2/shared/widgets/tarjeta_habito.dart';
import 'package:personalizacion_practica2/main.dart';

Finder enBarra(String texto) =>
    find.descendant(of: find.byType(NavigationBar), matching: find.text(texto));

void main() {
  testWidgets('el selector cambia el tema global y respeta el modo sistema', (
    tester,
  ) async {
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.light;
    addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
    await tester.pumpWidget(const HabitaApp());

    // NUEVO: llegar a Configuración antes de usar el selector
    await tester.tap(enBarra('Configuración'));
    await tester.pumpAndSettle();

    expect(
      Theme.of(tester.element(find.byType(Scaffold))).brightness,
      Brightness.light,
    );

    await tester.tap(find.text('Oscuro'));
    await tester.pumpAndSettle();
    expect(
      Theme.of(tester.element(find.byType(Scaffold))).brightness,
      Brightness.dark,
    );

    tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
    await tester.tap(find.text('Sistema'));
    await tester.pumpAndSettle();
    expect(
      Theme.of(tester.element(find.byType(Scaffold))).brightness,
      Brightness.dark,
    );
  });

  testWidgets('el estado de hábitos es compartido entre pantallas', (
    tester,
  ) async {
    await tester.pumpWidget(const HabitaApp());

    await tester.tap(find.byType(Checkbox).first);
    await tester.pump();
    expect(find.text('1 de 4 hábitos completados'), findsOneWidget);

    await tester.tap(enBarra('Mis hábitos'));
    await tester.pumpAndSettle();
    expect(find.text('1 de 4 hábitos completados'), findsOneWidget);
    expect(tester.widget<Checkbox>(find.byType(Checkbox).first).value, isTrue);
  });

  testWidgets('Mis hábitos pasa de 1 a 2 columnas según el ancho', (
    tester,
  ) async {
    addTearDown(tester.view.reset);
    tester.view.devicePixelRatio = 1;

    tester.view.physicalSize = const Size(400, 800);
    await tester.pumpWidget(const HabitaApp());
    await tester.tap(enBarra('Mis hábitos'));
    await tester.pumpAndSettle();
    final x1 = tester.getTopLeft(find.byType(TarjetaHabito).at(0)).dx;
    final x2 = tester.getTopLeft(find.byType(TarjetaHabito).at(1)).dx;
    expect(x1, x2); // misma columna

    tester.view.physicalSize = const Size(800, 800);
    await tester.pumpAndSettle();
    final y1 = tester.getTopLeft(find.byType(TarjetaHabito).at(0)).dy;
    final y2 = tester.getTopLeft(find.byType(TarjetaHabito).at(1)).dy;
    expect(y1, y2); // misma fila
  });
}
