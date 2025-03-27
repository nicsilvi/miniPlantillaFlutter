import 'package:autentification/app/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(),
);

class Autentication extends ConsumerWidget {
  static var routeName = '/';

  const Autentication({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return authState.isAuthenticated ? const HomeView() : const LoginPage();
  }
}

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);
    final notifier = ref.read(authControllerProvider.notifier);

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await notifier.login();
          },
          child: Text('Login: ${state.isAuthenticated}'),
        ),
      ),
    );
  }
}

class AuthController extends StateNotifier<AuthState> {
  AuthController() : super(AuthState.unauthenticated());

  // Simulación de un servicio de autenticación
  Future<void> login() async {
    // await Future.delayed(const Duration(
    //     seconds: 2)); // Simulando un retraso por la autenticación
    print('Usuario conectado');
    state = AuthState.authenticated();
  }

  Future<void> logout() async {
    // await Future.delayed(
    //     const Duration(seconds: 1)); // Simulando el cierre de sesión
    print('Usuario desconectado');
    state = AuthState.unauthenticated();
  }
}

// Definir el estado de autenticación
class AuthState {
  final bool isAuthenticated;

  //solo se podrá acceder a través de los dos metodos factory
  const AuthState._(this.isAuthenticated); //constructor privado (_xxx)

//crea y devuelve una instancia de AuthState.authenticated con valor true
  factory AuthState.authenticated() => const AuthState._(true);
  factory AuthState.unauthenticated() => const AuthState._(false);
}
