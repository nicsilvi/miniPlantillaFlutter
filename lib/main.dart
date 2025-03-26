import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/core/constants/global.dart';
import 'app/presentation/controllers/router_controller.dart';
import 'app/presentation/controllers/theme_controller.dart';
import 'app/presentation/shared/theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyAppConfig(),
    ),
  );
}

class MyAppConfig extends ConsumerWidget {
  const MyAppConfig({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: Global.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(ref.watch(themeControllerProvider)),
      routerConfig: ref.watch(goRouterProvider),
    );
  }
}
