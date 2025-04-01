import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/router_controller.dart';
import 'menu_lateral.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static const String routeName = 'home';
  @override
  ConsumerState<HomeView> createState() => _HomeviewState();
}

class _HomeviewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final userLoaderState =
        ref.watch(userLoaderFutureProvider); // Define userLoaderState

    return Scaffold(
      appBar: AppBar(
        title:
            Text("Bienvenido, ${userLoaderState.value?.firstName ?? "User"}"),
      ),
      endDrawer: const DrawerMenu(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Home center"),
        ),
      ),
    );
  }
}
