import 'package:autentification/app/presentation/views/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../views/home_view.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    navigatorKey: _navigatorKey,
    routes: [
      GoRoute(
        name: Autentication.routeName,
        path: '/',
        builder: (context, state) => const Autentication(),
      ),
      GoRoute(
        name: HomeView.routeName,
        path: '/home',
        builder: (context, state) => const HomeView(),
      )
    ],
    // redirect: (context, state) {
    //   if (authState.isAuthenticated) {
    //     return '/logout';
    //   }
    //   return '/';
    // },
  );
});
