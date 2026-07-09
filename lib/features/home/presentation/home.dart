// lib/features/home/presentation/home.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../features/auth/presentation/controller/auth_notifier.dart';
import 'controller/bottom_nav_notifier.dart';
import 'pages/home_page.dart';
import '../../../features/profile/presentation/pages/profile_page.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  // ടാബ് പേജുകളുടെ ലിസ്റ്റ്
  final List<Widget> _pages = const [
    HomePageWidget(),      // Tab 0: Home Page
    ProfilePageWidget(),   // Tab 1: Profile Page
  ];

  @override
  Widget build(BuildContext context) {
    // ➔ ലോഗൗട്ട് ചെയ്യുമ്പോൾ ലോഗിൻ പേജിലേക്ക് തിരികെ പോകാൻ ലിസണർ
    ref.listen(authNotifierProvider, (previous, next) {
      next.whenOrNull(
        data: (tokens) {
          if (tokens == null) {
            context.router.replaceAll([const LoginRoute()]);
          }
        },
      );
    });

    // ➔ റിവർപോഡ് പ്രൊവൈഡർ വഴി കറന്റ് ഇൻഡെക്സ് വാച്ച് ചെയ്യുന്നു (Reactive)
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          // ➔ റിവർപോഡ് നോട്ടിഫയർ വഴി ഇൻഡെക്സ് മാറ്റുന്നു
          ref.read(bottomNavIndexProvider.notifier).setIndex(index);
        },
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
