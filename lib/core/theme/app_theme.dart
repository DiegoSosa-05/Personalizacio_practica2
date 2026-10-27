import 'package:flutter/material.dart';

/// Temas globales de Habita. Las pantallas deben tomar colores y estilos de
/// Theme.of(context) para conservar la identidad en ambos modos.
abstract final class AppTheme {
  static const _green = Color(0xFF426B50);
  static const _lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: _green,
    onPrimary: Colors.white,
    secondary: Color(0xFF71866B),
    onSecondary: Colors.white,
    error: Color(0xFFBA1A1A),
    onError: Colors.white,
    surface: Color(0xFFFAFAF6),
    onSurface: Color(0xFF202821),
    surfaceContainerHighest: Color(0xFFE9EDE6),
    outline: Color(0xFF74796F),
  );
  static const _darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFA5D0AC),
    onPrimary: Color(0xFF123820),
    secondary: Color(0xFFB8CDB2),
    onSecondary: Color(0xFF273B2B),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    surface: Color(0xFF171D18),
    onSurface: Color(0xFFE1E8DF),
    surfaceContainerHighest: Color(0xFF303831),
    outline: Color(0xFF899189),
  );

  static final ThemeData lightTheme = _buildTheme(_lightScheme);
  static final ThemeData darkTheme = _buildTheme(_darkScheme);

  static ThemeData _buildTheme(ColorScheme scheme) {
    final isDark = scheme.brightness == Brightness.dark;
    final mutedText = isDark ? const Color(0xFFB5C0B5) : const Color(0xFF5D685E);
    final border = isDark ? const Color(0xFF424C43) : const Color(0xFFDCE2D9);
    final textTheme = ThemeData(brightness: scheme.brightness).textTheme.copyWith(
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: scheme.onSurface),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: scheme.onSurface),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: scheme.onSurface),
      bodyLarge: TextStyle(fontSize: 16, color: scheme.onSurface),
      bodyMedium: TextStyle(fontSize: 14, color: scheme.onSurface),
      bodySmall: TextStyle(fontSize: 12, color: mutedText),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: isDark ? const Color(0xFF111712) : const Color(0xFFF3F5F0),
      textTheme: textTheme,
      iconTheme: IconThemeData(color: scheme.primary),
      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? const Color(0xFF171D18) : const Color(0xFFF3F5F0),
        foregroundColor: scheme.onSurface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge,
      ),
      cardTheme: CardThemeData(
        color: isDark ? const Color(0xFF202821) : const Color(0xFFFAFAF6),
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          minimumSize: const Size(48, 48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.primary,
          side: BorderSide(color: border),
          minimumSize: const Size(48, 48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: scheme.primary),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? const Color(0xFF202821) : const Color(0xFFFAFAF6),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: border)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: border)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: scheme.primary, width: 2)),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
      ),
      dividerColor: border,
    );
  }
}
