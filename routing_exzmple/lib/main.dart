import 'package:flutter/material.dart';
// import 'package:auto_route/auto_route.dart';
import 'app_routes.dart';
import 'guards.dart';

void main() {
  final appRouter = AppRouter(authGuard: AuthGuard());
  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      title: 'AutoRoute Example',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
