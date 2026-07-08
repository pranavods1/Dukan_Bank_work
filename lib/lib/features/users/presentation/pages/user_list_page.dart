// lib/features/users/presentation/pages/user_list_page.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../core/widgets/common_loader.dart';
import '../../../../core/widgets/theme_provider.dart'; // ➔ 1. തീം പ്രൊവൈഡർ ഇമ്പോർട്ട് ചെയ്തു
import '../../domain/entities/user.dart';
import '../controller/user_notifier.dart';

@RoutePage()
class UserListPage extends ConsumerStatefulWidget {
  const UserListPage({super.key});

  @override
  ConsumerState<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends ConsumerState<UserListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(userNotifierProvider.notifier).getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userNotifierProvider);

    return Scaffold(
      backgroundColor: context.background, // ➔ 2. പേജിന്റെ കസ്റ്റം പശ്ചാത്തല നിറം നൽകുന്നു
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: const Icon(Icons.arrow_back)
        ),
        title: const Text('Dummy Users List'),

        // ➔ 3. ഹാർഡ്‌കോഡ് ചെയ്ത ബ്ലൂ മാറ്റി കസ്റ്റം ബ്രാൻഡ് കളർ നൽകി
        backgroundColor: context.brand,

        // ➔ 4. തീം ലൈറ്റ്/ഡാർക്ക് ആക്കാനുള്ള സ്വിച്ച് ബട്ടൺ ഇവിടെ ചേർത്തു
        actions: [
          IconButton(
            icon: Icon(
              ref.watch(themeModeProvider) == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              final currentMode = ref.read(themeModeProvider);
              ref.read(themeModeProvider.notifier).state =
              currentMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
            },
          )
        ],
      ),
      body: CommonLoader<List<UserEntity>>(
        state: state,
        onData: (users) {
          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(userNotifierProvider.notifier).getUsers();
            },
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  color: context.card, // ➔ 5. ലിസ്റ്റിലെ കാർഡിന് കസ്റ്റം കാർഡ് കളർ നൽകി
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: ListTile(
                    onTap: () {
                  context.router.push(UserDetailRoute(userId: user.id));
                },
                leading: CircleAvatar(
                backgroundImage: NetworkImage(user.imageUrl),
                ),

                // ➔ 1. ടൈറ്റിൽ കളർ മാറ്റുന്നു
                title: Text(
                user.name,
                style: TextStyle(
                color: context.textColor, // ഗ്രേ അല്ലെങ്കിൽ പച്ചയാകും!
                fontWeight: FontWeight.bold,
                ),
                ),

                // ➔ 2. സബ്‌ടൈറ്റിൽ കളർ മാറ്റുന്നു
                subtitle: Text(
                user.email,
                style: TextStyle(
                color: context.textColor.withOpacity(0.7),
                ),
                ),
                ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
