import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// import 'app_routes.gr.dart';

class AuthGuard extends AutoRouteGuard {
  bool isLoggedIn = false; // contoh login state

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (isLoggedIn) {
      resolver.next(true);
    } else {
      // Tampilkan dialog login
      showDialog(
        context: router.navigatorKey.currentContext!,
        builder: (context) => AlertDialog(
          title: const Text('Login Diperlukan'),
          content: const Text('Anda harus login terlebih dahulu.'),
          actions: [
            TextButton(
              onPressed: () {
                isLoggedIn = true;
                resolver.next(true); // lanjut ke halaman tujuan
                Navigator.of(context).pop();
              },
              child: const Text('Login'),
            ),
          ],
        ),
      );
    }
  }
}
