import 'package:autentification/app/presentation/views/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controllers/theme_controller.dart';

class DrawerMenu extends ConsumerWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeService = ref.watch(
        themeControllerProvider); // es watch pq se reconstruye este mismo widget
    final authService = ref.read(authControllerProvider
        .notifier); //aqui no se reconstruye, sino qe cambia de pantalla

    return Drawer(
        child: SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Menú",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Perfil"),
              onTap: () {
                //ir al profileview
                // context.go('/profile');
              },
            ),
            ListTile(
              leading: Icon(themeService ? Icons.light_mode : Icons.dark_mode),
              title: Text(themeService ? "modo claro" : "modo oscuro"),
              onTap: () {
                context.pop();
                ref.read(themeControllerProvider.notifier).updateTheme();
                print("thema ahora es: ${ref.read(themeControllerProvider)}");
              },
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Cerrar sesión"),
              onTap: () async {
                await authService.logout();
                if (!context.mounted) return;
                context.go('/');
              },
            ),
          ],
        ),
      ),
    ));
  }
}
