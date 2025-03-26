import 'package:autentification/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Logoutview extends ConsumerWidget {
  const Logoutview({super.key});
  static var routeName = '/logout';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.read(authServiceProvider.notifier);

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
          child: ElevatedButton(
            onPressed: () async {
              await authService.logout();
              context.go('/');
            },
            child: Text('Logout'),
          ),
        ),
      ),
    );
  }
}
