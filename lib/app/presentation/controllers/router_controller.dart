import 'package:autentification/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../views/logout.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  return GoRouter(
    initialLocation: '/',
    navigatorKey: _navigatorKey,
    routes: [
      GoRoute(
        name: Autentification.routeName,
        path: '/',
        builder: (context, state) => const Autentification(),
      ),
      GoRoute(
        name: Logoutview.routeName,
        path: '/logout',
        builder: (context, state) => const Logoutview(),
      ),
    ],
    redirect: (context, state) {
      if (authState.isAuthenticated) {
        return '/logout';
      }
      return '/';
    },
  );
});
