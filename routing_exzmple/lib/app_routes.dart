import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'second_screen.dart';
import 'guard_screen.dart';
import 'detail_screen.dart';
import 'guards.dart';

part 'app_routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  AppRouter({required this.authGuard});
  final AuthGuard authGuard;

  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: HomeScreen()),
        AutoRoute(path: '/second', page: SecondScreen, guards: [authGuard]),
        AutoRoute(path: '/guard', page: GuardScreen, guards: [authGuard]),
        AutoRoute(path: '/detail/:id', page: DetailScreen),
      ];

  config() {}
}
