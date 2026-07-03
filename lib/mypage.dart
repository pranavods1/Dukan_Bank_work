import 'package:auto_route/auto_route.dart'; // 1. ഇത് ഇമ്പോർട്ട് ചെയ്യുക
import 'package:flutter/material.dart';

import 'lib/core/router/app_router.gr.dart';

@RoutePage() // 2. ഈ അനോട്ടേഷൻ ചേർക്കുക
class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MypageState();
}

class _MypageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.router.popUntilRouteWithName(HomeRoute.name);
            },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}
