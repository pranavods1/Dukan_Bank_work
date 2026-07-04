// lib/features/users/presentation/pages/user_list_page.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../core/widgets/common_loader.dart';
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
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          context.router.pop();
        }, icon: Icon(Icons.arrow_back)),
        title: const Text('Dummy Users List'),
        backgroundColor: Colors.blueAccent,
      ),
      // ➔ ഇവിടെ (users) എന്ന് തിരുത്തിയിട്ടുണ്ട്
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
                return ListTile(
                  onTap: () {
                    context.router.push(UserDetailRoute(userId: user.id));
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.imageUrl),
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
