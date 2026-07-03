// lib/features/users/presentation/pages/user_list_page.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/user_notifier.dart'; // UserNotifier ഇമ്പോർട്ട് ചെയ്യുന്നു
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
    // 1. പേജ് ലോഡ് ആകുമ്പോൾ വെയ്റ്ററോട് ഓർഡർ ചെയ്യാൻ പറയുന്നു (ref.read)
    Future.microtask(() {
      ref.read(userNotifierProvider.notifier).getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    // 2. വെയ്റ്ററുടെ പ്ലേറ്റിലേക്ക് നോക്കിയിരിക്കുന്നു (ref.watch)
    final state = ref.watch(userNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy Users List'),
        backgroundColor: Colors.blueAccent,
      ),
      // 3. പ്ലേറ്റിന്റെ ഓരോ അവസ്ഥകൾക്ക് അനുസരിച്ച് സ്ക്രീൻ മാറ്റുന്നു (State mapping)
      body: state.when(
        initial: () => const Center(child: Text('തുടങ്ങിയിട്ടില്ല')),

        loading: () => const Center(child: CircularProgressIndicator()), // വട്ടത്തിൽ ലോഡിങ് കറങ്ങുന്നു

        failure: (err) => Center(child: Text('Error : $err')), // എറർ ആണെങ്കിൽ ഇത് കാണിക്കും

        success: (users) { // വിജയിച്ചാൽ യൂസർമാരുടെ ലിസ്റ്റ് കാണിക്കുന്നു
          return RefreshIndicator( onRefresh: () async {
            // Notifier-ലെ getUsers() ഫംഗ്ഷൻ വീണ്ടും റൺ ചെയ്യുന്നു
            await ref.read(userNotifierProvider.notifier).getUsers();
          },
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.imageUrl), // യൂസറുടെ ഫോട്ടോ കാണിക്കുന്നു
                  ),
                  title: Text(user.name), // യൂസറുടെ പേര് കാണിക്കുന്നു
                  subtitle: Text(user.email), // യൂസറുടെ ഇമെയിൽ കാണിക്കുന്നു
                );
              },
            ),
          );
        },
      ),
    );
  }
}
