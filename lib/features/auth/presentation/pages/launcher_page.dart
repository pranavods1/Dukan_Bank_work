// lib/features/auth/presentation/pages/launcher_page.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/router/app_router.gr.dart';
import '../controller/auth_notifier.dart';

@RoutePage()
class LauncherPage extends ConsumerWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ➔ ലോഗിൻ സ്റ്റേറ്റ് മാറുന്നത് നമ്മൾ വാച്ച് ചെയ്യുന്നു
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      body: authState.when(
        // ടോക്കൺ ഉണ്ടോ എന്ന് പരിശോധിച്ചു കഴിഞ്ഞാൽ:
        data: (tokens) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (tokens != null) {
              // ➔ ടോക്കൺ ഉണ്ടെങ്കിൽ ലോഗിൻ ഒഴിവാക്കി നേരിട്ട് ഹോം ഡാഷ്‌ബോർഡിലേക്ക് പോകുന്നു!
              context.router.replaceAll([const HomeRoute()]);
            } else {
              // ➔ ടോക്കൺ ഇല്ലെങ്കിൽ ലോഗിൻ സ്ക്രീനിലേക്ക് കൊണ്ടുപോകുന്നു
              context.router.replaceAll([const LoginRoute()]);
            }
          });
          return const Center(child: CircularProgressIndicator());
        },
        // ചെക്ക് ചെയ്യുന്ന സമയം വരെ സ്ക്രീനിൽ ഒരു സ്പിന്നർ കാണിക്കും
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.router.replaceAll([const LoginRoute()]);
          });
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
