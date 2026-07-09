// lib/features/profile/presentation/pages/profile_page.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../features/auth/presentation/controller/auth_notifier.dart';
import '../controller/profile_notifier.dart';

@RoutePage()
class ProfilePageWidget extends ConsumerWidget {
  const ProfilePageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ➔ റിവർപോഡ് നോട്ടിഫയർ വഴി പ്രൊഫൈൽ സ്റ്റേറ്റ് വാച്ച് ചെയ്യുന്നു
    final profileState = ref.watch(profileNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: profileState.when(
        // ➔ പ്രൊഫൈൽ വിജയകരമായി ലോഡ് ആയാൽ
        data: (profile) {
          if (profile == null) {
            return const Center(child: Text('No profile data found.'));
          }

          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 20.0),
                      child: Column(
                        children: [
                          // ➔ സർവറിൽ നിന്നും കിട്ടിയ ഇമേജ് ലോഡ് ചെയ്യുന്നു
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.blueAccent.withOpacity(0.1),
                            backgroundImage: NetworkImage(profile.avatar),
                          ),
                          const SizedBox(height: 15),

                          // ➔ യഥാർത്ഥ പേര്
                          Text(
                            profile.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),

                          // ➔ യഥാർത്ഥ റോൾ
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              profile.role.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          const Divider(),

                          // ➔ യഥാർത്ഥ ഇമെയിൽ വിവരങ്ങൾ
                          ListTile(
                            leading: const Icon(Icons.email_outlined),
                            title: const Text('Email'),
                            subtitle: Text(profile.email),
                          ),
                          ListTile(
                            leading: const Icon(Icons.perm_identity_rounded),
                            title: const Text('User ID'),
                            subtitle: Text(profile.id.toString()),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Logout Button
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.redAccent,
                      side: const BorderSide(color: Colors.redAccent, width: 1.5),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    icon: const Icon(Icons.logout_rounded),
                    label: const Text(
                      'Logout',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      ref.read(authNotifierProvider.notifier).logout();
                    },
                  ),
                ],
              ),
            ),
          );
        },
        // ➔ ലോഡ് ചെയ്യുന്ന സമയത്ത് ഒരു സ്പിന്നർ കാണിക്കും
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        // ➔ എപിഐ എറർ സംഭവിച്ചാൽ റിട്രൈ ഓപ്ഷൻ കാണിക്കും
        error: (err, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline_rounded, color: Colors.red, size: 60),
                const SizedBox(height: 16),
                Text(
                  err.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    // പ്രൊഫൈൽ വീണ്ടും ഫെച്ച് ചെയ്യാൻ നോട്ടിഫയർ ഇൻവാലിഡേറ്റ് ചെയ്യുന്നു
                    ref.invalidate(profileNotifierProvider);
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Retry'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
