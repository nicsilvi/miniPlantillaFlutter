import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
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
