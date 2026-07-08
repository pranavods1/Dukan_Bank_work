import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:std_prj/lib/core/router/app_router.gr.dart';

import 'lib/core/widgets/theme_provider.dart';

@RoutePage()
class DetailsScreen extends ConsumerWidget {
  final String message; // Parameter സ്വീകരിക്കാൻ

  const DetailsScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Passed Message: $message',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.router.push(const UserListRoute());
              },
              child: const Text('Get user'),
            ),

            // നിങ്ങളുടെ ഏതെങ്കിലും സ്ക്രീനിലെ Widget build-ൽ ആഡ് ചെയ്യാവുന്നത്:

            IconButton(
              icon: Icon(
                ref.watch(themeModeProvider) == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
              onPressed: () {
                // ➔ തീം മോഡ് തിരിച്ചു സ്വിച്ച് ചെയ്യുന്നു
                final currentMode = ref.read(themeModeProvider);
                ref.read(themeModeProvider.notifier).state =
                currentMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
              },
            )

          ],
        ),
      ),
    );
  }
}
