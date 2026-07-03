import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:std_prj/lib/core/router/app_router.gr.dart';

@RoutePage()
class DetailsScreen extends StatelessWidget {
  final String message; // Parameter സ്വീകരിക്കാൻ

  const DetailsScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
  }
}
