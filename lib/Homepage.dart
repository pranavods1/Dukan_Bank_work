import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'lib/core/router/app_router.gr.dart'; // generated file

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // DetailsPageRoute ലേക്ക് നാവിഗേറ്റ് ചെയ്യുന്നു, ഒപ്പം 'Hello World' എന്ന മെസ്സേജും അയക്കുന്നു
            context.router.push(DetailsRoute(message: 'Hello World!'));
          },
          child: const Text('Go to Details Screen'),
        ),
      ),
    );
  }
}
