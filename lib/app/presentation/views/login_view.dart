import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controllers/auth_controller.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});
  static var routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final state = ref.watch(authenticationRepositoryProvider);
    final authNotifier = ref.read(authenticationRepositoryProvider);
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width *
                  0.1, // 10% del ancho de la pantalla
              vertical: MediaQuery.of(context).size.height *
                  0.1, // 10% del alto de la pantalla
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Inicio de sesión",
                    style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(height: 24),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Correo electrónico",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),

                // Campo de contraseña
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    await authNotifier.signIn(
                        emailController.text, passwordController.text);
                  },
                  child: Text('Login'),
                ),
                SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    context.go('/register');
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: "¿No tienes cuenta?   ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Regístrate",
                          style: TextStyle(color: Colors.greenAccent),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
