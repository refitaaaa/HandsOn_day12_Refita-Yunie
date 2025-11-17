import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

// Simulasi status login (dalam aplikasi nyata, gunakan state management)
class AuthService {
  static bool _isLoggedIn = false;

  static bool get isLoggedIn => _isLoggedIn;

  static void login() {
    _isLoggedIn = true;
  }

  static void logout() {
    _isLoggedIn = false;
  }
}

// Auth Guard
class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (AuthService.isLoggedIn) {
      resolver.next(true);
    } else {
      resolver.next(false);
      // Tampilkan dialog login
      showDialog(
        context: router.navigatorKey.currentContext!,
        builder: (context) => AlertDialog(
          title: const Text('Login Diperlukan'),
          content: const Text('Silakan login untuk mengakses halaman ini.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                AuthService.login();
                Navigator.of(context).pop();
                resolver.next(true);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      );
    }
  }
}

@RoutePage()
class GuardScreen extends StatelessWidget {
  const GuardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Terlindungi'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            onPressed: () {
              AuthService.logout();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Anda telah logout'),
                  backgroundColor: Colors.red,
                ),
              );
              context.router.maybePop();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock_open,
                size: 100,
                color: Colors.orange,
              ),
              const SizedBox(height: 20),
              const Text(
                '🎉 Akses Berhasil!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Ini adalah halaman yang dilindungi dengan Auth Guard.\nAnda harus login untuk mengaksesnya.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.orange.shade200),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.verified_user, color: Colors.orange),
                    const SizedBox(height: 8),
                    const Text(
                      'Status: Terautentikasi',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'User ID: ${AuthService.isLoggedIn ? "user_123" : "guest"}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}