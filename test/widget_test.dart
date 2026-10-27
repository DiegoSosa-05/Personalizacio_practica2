import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalizacion_practica2/main.dart';

void main() {
  testWidgets('el selector cambia el tema global y respeta el modo sistema', (tester) async {
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.light;
    await tester.pumpWidget(const HabitaApp());

    expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.light);

    await tester.tap(find.text('Oscuro'));
    await tester.pumpAndSettle();
    expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.dark);

    tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
    await tester.tap(find.text('Sistema'));
    await tester.pumpAndSettle();
    expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.dark);
  });
}
