// lib/lib/features/auth/presentation/pages/login_page.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../core/widgets/custom_button.dart'; // നമ്മൾ മുൻപ് ഉണ്ടാക്കിയ കസ്റ്റം ബട്ടൺ
import '../controller/auth_notifier.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _BlockActions extends ConsumerWidget {
  final Widget child;
  const _BlockActions({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authNotifierProvider);
    return AbsorbPointer(
      absorbing: state.isLoading,
      child: child,
    );
  }
}

class _LoginPageState extends ConsumerState<LoginPage> {
  // പ്ലാറ്റ്‌സി എപിഐയിലെ ഡിഫോൾട്ട് ലോഗിൻ വിവരങ്ങൾ മുൻകൂട്ടി സെറ്റ് ചെയ്തു വെക്കുന്നു
  final _emailController = TextEditingController(text: 'pranav@gmail.com');
  final _passwordController = TextEditingController(text: '123456');

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ➔ ലോഗിൻ വിജയകരമായാൽ ഓട്ടോമാറ്റിക് ആയി യൂസർ ലിസ്റ്റ് സ്ക്രീനിലേക്ക് കൊണ്ടുപോകാൻ ലിസണർ വെക്കുന്നു
    ref.listen(authNotifierProvider, (previous, next) {
      next.whenOrNull(
        data: (tokens) {
          if (tokens != null) {
            // വിജയകരമായി ലോഗിൻ ചെയ്താൽ ഹോം ഡാഷ്‌ബോർഡിലേക്ക് പോകുന്നു
            context.router.replaceAll([const HomeRoute()]);
          }
        },
        error: (error, _) {
          // ലോഗിൻ പരാജയപ്പെട്ടാൽ സ്നാക്ക് ബാർ കാണിക്കുന്നു
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
              backgroundColor: Colors.red,
            ),
          );
        },
      );
    });

    final authState = ref.watch(authNotifierProvider);

    return _BlockActions(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Welcome Back',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // ഇമെയിൽ ഇൻപുട്ട് ഫീൽഡ്
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // പാസ്‌വേഡ് ഇൻപുട്ട് ഫീൽഡ്
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),

              // ➔ നമ്മൾ നിർമ്മിച്ച കസ്റ്റം ബട്ടൺ ഇവിടെ ഉപയോഗിക്കുന്നു
              authState.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : CustomButton(
                text: 'Login',
                onPressed: () {
                  // ലോഗിൻ നോട്ടിഫയറിനെ വിളിക്കുന്നു
                  ref.read(authNotifierProvider.notifier).login(
                    _emailController.text.trim(),
                    _passwordController.text.trim(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
