// lib/lib/core/widgets/theme_provider.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Color hexToColor(String hex) {
  return Color(int.parse(hex.replaceFirst('#', '0xff')));
}

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

class ThemeState {
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  ThemeState({required this.lightTheme, required this.darkTheme});
}

class ThemeStateNotifier extends StateNotifier<ThemeState> {
  ThemeStateNotifier() : super(ThemeState(lightTheme: ThemeData.light(), darkTheme: ThemeData.dark())) {
    loadThemeFromJson();
  }

  Future<void> loadThemeFromJson() async {
    try {
      final jsonString = await rootBundle.loadString('assets/app_theme.json');
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

      // ➔ 1. Light Theme കളറുകൾ
      final lightMap = jsonMap['light'];
      final lightBrand = hexToColor(lightMap['brandColor']);
      final lightBg = hexToColor(lightMap['backgroundColor']);
      final lightCard = hexToColor(lightMap['cardColor']);
      final lightText = hexToColor(lightMap['textColor']); // റീഡ് ചെയ്യുന്നു

      // ➔ 2. Dark Theme കളറുകൾ
      final darkMap = jsonMap['dark'];
      final darkBrand = hexToColor(darkMap['brandColor']);
      final darkBg = hexToColor(darkMap['backgroundColor']);
      final darkCard = hexToColor(darkMap['cardColor']);
      final darkText = hexToColor(darkMap['textColor']); // റീഡ് ചെയ്യുന്നു

      state = ThemeState(
        lightTheme: ThemeData.light().copyWith(
          primaryColor: lightBrand,
          scaffoldBackgroundColor: lightBg,
          cardColor: lightCard,
          colorScheme: ColorScheme.light(
            primary: lightBrand,
            surface: lightCard,
            onSurface: lightText, // ➔ ഇവിടെ മാപ്പ് ചെയ്തു
          ),
        ),
        darkTheme: ThemeData.dark().copyWith(
          primaryColor: darkBrand,
          scaffoldBackgroundColor: darkBg,
          cardColor: darkCard,
          colorScheme: ColorScheme.dark(
            primary: darkBrand,
            surface: darkCard,
            onSurface: darkText, // ➔ ഇവിടെ മാപ്പ് ചെയ്തു
          ),
        ),
      );
    } catch (e) {
      debugPrint("Theme load failed: $e");
    }
  }
}

final myThemeProvider = StateNotifierProvider<ThemeStateNotifier, ThemeState>((ref) {
  return ThemeStateNotifier();
});

// ➔ 3. കസ്റ്റം ഗെറ്ററിൽ 'textColor' കൂടി ചേർത്തു
extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);

  Color get brand => theme.primaryColor;
  Color get background => theme.scaffoldBackgroundColor;
  Color get card => theme.cardColor;
  Color get textColor => theme.colorScheme.onSurface; // ➔ ടെക്സ്റ്റ് കളർ
}
