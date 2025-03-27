import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/auth_controller.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});
  static var routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authenticationRepositoryProvider);
    final notifier = ref.read(authenticationRepositoryProvider);

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            //await notifier.login();
          },
          child: Text('Login: '),
        ),
      ),
    );
  }
}
