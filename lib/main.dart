import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/app_router.dart';
import 'core/router/observers/screen_tracking_observer.dart';
import 'core/widgets/theme_provider.dart';


void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ➔ നമ്മുടെ രണ്ട് തീമുകൾ അടങ്ങിയ സ്റ്റേറ്റ് വാച്ച് ചെയ്യുന്നു
    final themes = ref.watch(myThemeProvider);
    // ➔ കറന്റ് തീം മോഡ് (Light / Dark) വാച്ച് ചെയ്യുന്നു
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      routerConfig: _appRouter.config(
        navigatorObservers: () => [ScreenTrackingObserver()],
      ),
      title: 'AutoRoute Demo',
      theme: themes.lightTheme,
      darkTheme: themes.darkTheme,
      themeMode: themeMode,
    );
  }
}
